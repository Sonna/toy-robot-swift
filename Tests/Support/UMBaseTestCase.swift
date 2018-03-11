// == References:
// - [Swift 3 · Testing solutions to your exercises]
//   (https://coding-exercises.udemy.com/swift_3.html)
import XCTest
import Foundation
// @testable import Base

struct Support {
    class UMBaseTestCase: XCTestCase {
        var savedStdOut:Int32!
        var savedStdIn:Int32!

        let stdInLogFile = "tmp/stdIn.log"
        let stdOutLogFile = "tmp/stdOut.log"

        var isStdOutRedirected:Bool!
        var isStdInRedirected:Bool!

        override func setUp() {
            super.setUp()
            isStdOutRedirected = false
            isStdInRedirected = false
        }

        override func tearDown(){
            super.tearDown()
            if(isStdOutRedirected == true){
                self.restoreStdOutToDefault()
            }
            if(isStdInRedirected == true){
                self.restoreStdInToDefault()
            }
        }

        //Redirect StandardInput in order to read from log file
        func setStdInput(input:String){
            do {
                try input.write(
                    toFile:stdInLogFile,
                    atomically: true,
                    encoding: String.Encoding.utf8
                )
            } catch {
                // failed to write file
            }
            isStdInRedirected = true
            savedStdIn = dup(STDIN_FILENO)
            freopen(stdInLogFile, "r", stdin)
        }

        //Redirect StandardOutput to log file
        func prepareStdOut() {
            isStdOutRedirected = true
            savedStdOut = dup(STDOUT_FILENO)
            freopen(stdOutLogFile, "w", stdout)
        }

        //Read from StandardOutput from log file
        func getOutput() -> String {
            //Restrore standartOutput
            //This is important to restore to get Test results
            self.restoreStdOutToDefault()
            let content = try! String(
                contentsOfFile: stdOutLogFile,
                encoding: String.Encoding.utf8
            )
            return content
        }

        private func restoreStdOutToDefault(){
            isStdOutRedirected = false
            fflush(stdout)
            dup2(savedStdOut, STDOUT_FILENO)
            close(savedStdOut)
        }

        private func restoreStdInToDefault(){
            isStdInRedirected = false
            dup2(savedStdIn, STDIN_FILENO)
            close(savedStdIn)
        }
    }
}
