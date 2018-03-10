import XCTest
@testable import ToyRobot

class ToyRobotTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ToyRobot().text, "Hello, World!")
    }

    func testRobotConstuctor() {
        let subject = ToyRobot.Robot()
        XCTAssertEqual(subject.x, 0)
        XCTAssertEqual(subject.y, 0)
        XCTAssertEqual(subject.facing, "NORTH")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
