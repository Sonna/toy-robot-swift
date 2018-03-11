import XCTest
@testable import ToyRobot

class ToyRobotTests: Support.UMBaseTestCase {
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

    func testRobotConstuctorWithX() {
        let subject = ToyRobot.Robot(x: 1)
        XCTAssertEqual(subject.x, 1)
        XCTAssertEqual(subject.y, 0)
        XCTAssertEqual(subject.facing, "NORTH")
    }

    func testRobotConstuctorWithY() {
        let subject = ToyRobot.Robot(y: 1)
        XCTAssertEqual(subject.x, 0)
        XCTAssertEqual(subject.y, 1)
        XCTAssertEqual(subject.facing, "NORTH")
    }

    func testRobotConstuctorWithFacing() {
        let subject = ToyRobot.Robot(facing: "SOUTH")
        XCTAssertEqual(subject.x, 0)
        XCTAssertEqual(subject.y, 0)
        XCTAssertEqual(subject.facing, "SOUTH")
    }

    func testRobotConstuctorWithAllParameters() {
        let subject = ToyRobot.Robot(x: 1, y: 1, facing: "SOUTH")
        XCTAssertEqual(subject.x, 1)
        XCTAssertEqual(subject.y, 1)
        XCTAssertEqual(subject.facing, "SOUTH")
    }

    func testRobotReport() {
        let subject = ToyRobot.Robot()
        self.prepareStdOut()
        subject.report()

        XCTAssertEqual(self.getOutput(), "0, 0, NORTH\n")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
