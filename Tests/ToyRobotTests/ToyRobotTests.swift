import XCTest
@testable import Support
@testable import ToyRobot

typealias UMBaseTestCase = Support.UMBaseTestCase

class ToyRobotTests: UMBaseTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the
        // correct results.
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

    func testRobotLeft() {
        let subject = ToyRobot.Robot()
        subject.left()
        XCTAssertEqual(subject.x, 0)
        XCTAssertEqual(subject.y, 0)
        XCTAssertEqual(subject.facing, "WEST")
    }

    func testRobotRight() {
        let subject = ToyRobot.Robot()
        subject.right()
        XCTAssertEqual(subject.x, 0)
        XCTAssertEqual(subject.y, 0)
        XCTAssertEqual(subject.facing, "EAST")
    }

    func testRobotMove() {
        let subject = ToyRobot.Robot()
        subject.move()
        XCTAssertEqual(subject.x, 0)
        XCTAssertEqual(subject.y, 1)
        XCTAssertEqual(subject.facing, "NORTH")
    }

    func testRobotMoveEast() {
        let subject = ToyRobot.Robot()
        subject.right()
        subject.move()
        XCTAssertEqual(subject.x, 1)
        XCTAssertEqual(subject.y, 0)
        XCTAssertEqual(subject.facing, "EAST")
    }

    func testRobotMoveWest() {
        let subject = ToyRobot.Robot()
        subject.left()
        subject.move()
        XCTAssertEqual(subject.x, 0)
        XCTAssertEqual(subject.y, 0)
        XCTAssertEqual(subject.facing, "WEST")
    }

    func testRobotMoveSouth() {
        let subject = ToyRobot.Robot()
        subject.left()
        subject.left()
        subject.move()
        XCTAssertEqual(subject.x, 0)
        XCTAssertEqual(subject.y, 0)
        XCTAssertEqual(subject.facing, "SOUTH")
    }

    func testRobotPlace() {
        let subject = ToyRobot.Robot()
        // subject.place(coordinate: "1,1,EAST")
        subject.place("1,1,EAST")

        XCTAssertEqual(subject.x, 1)
        XCTAssertEqual(subject.y, 1)
        XCTAssertEqual(subject.facing, "EAST")
    }

    func testRobotCannotMoveOffTableAt40South() {
        let subject = ToyRobot.Robot()
        subject.place("4,0,SOUTH")

        XCTAssertEqual(subject.x, 4)
        XCTAssertEqual(subject.y, 0)
        XCTAssertEqual(subject.facing, "SOUTH")
    }

    func testRobotCannotMoveOffTableAt40East() {
        let subject = ToyRobot.Robot()
        subject.place("4,0,EAST")

        XCTAssertEqual(subject.x, 4)
        XCTAssertEqual(subject.y, 0)
        XCTAssertEqual(subject.facing, "EAST")
    }

    func testRobotCannotMoveOffTableAt44North() {
        let subject = ToyRobot.Robot()
        subject.place("4,4,NORTH")

        XCTAssertEqual(subject.x, 4)
        XCTAssertEqual(subject.y, 4)
        XCTAssertEqual(subject.facing, "NORTH")
    }

    func testRobotCannotMoveOffTableAt44East() {
        let subject = ToyRobot.Robot()
        subject.place("4,4,EAST")

        XCTAssertEqual(subject.x, 4)
        XCTAssertEqual(subject.y, 4)
        XCTAssertEqual(subject.facing, "EAST")
    }

    func testRobotCannotMoveOffTableAt04West() {
        let subject = ToyRobot.Robot()
        subject.place("0,4,WEST")

        XCTAssertEqual(subject.x, 0)
        XCTAssertEqual(subject.y, 4)
        XCTAssertEqual(subject.facing, "WEST")
    }

    func testRobotCannotMoveOffTableAt04North() {
        let subject = ToyRobot.Robot()
        subject.place("0,4,NORTH")

        XCTAssertEqual(subject.x, 0)
        XCTAssertEqual(subject.y, 4)
        XCTAssertEqual(subject.facing, "NORTH")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
