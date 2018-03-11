import XCTest
@testable import Support
@testable import ToyRobot

typealias UMBaseTestCase = Support.UMBaseTestCase

class ToyRobotTests: UMBaseTestCase {
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

    func testRobotExecReport() {
        let subject = ToyRobot.Robot()

        self.prepareStdOut()
        subject.exec("REPORT")

        XCTAssertEqual(self.getOutput(), "0, 0, NORTH\n")
    }

    func testMain() {
        self.prepareStdOut()
        self.setStdInput(input: "EXIT\n")

        ToyRobot.main()

        XCTAssertEqual(self.getOutput(), "")
    }

    func testMainReport() {
        self.prepareStdOut()
        self.setStdInput(input: "REPORT\nEXIT\n")

        ToyRobot.main()

        XCTAssertEqual(self.getOutput(), "0, 0, NORTH\n")
    }

    func testMainMove() {
        self.prepareStdOut()
        self.setStdInput(
            input: "REPORT\nMOVE\nMOVE\nRIGHT\nMOVE\nREPORT\nEXIT\n"
        )

        ToyRobot.main()

        XCTAssertEqual(self.getOutput(), "0, 0, NORTH\n1, 2, EAST\n")
    }

    func testMainFileInputExampleA() {
        self.prepareStdOut()
        ToyRobot.main(["testMainFileInput", "Tests/data/example_a.txt"])

        XCTAssertEqual(self.getOutput(), "0, 0, NORTH\n")
    }

    func testMainFileInputExampleB() {
        self.prepareStdOut()
        ToyRobot.main(["testMainFileInput", "Tests/data/example_b.txt"])

        XCTAssertEqual(self.getOutput(), "0, 1, NORTH\n2, 1, EAST\n")
    }

    static var allTests = [
        ("testRobotConstuctor", testRobotConstuctor),
        ("testRobotConstuctorWithX", testRobotConstuctorWithX),
        ("testRobotConstuctorWithY", testRobotConstuctorWithY),
        ("testRobotConstuctorWithFacing", testRobotConstuctorWithFacing),
        ("testRobotConstuctorWithAllParameters", testRobotConstuctorWithAllParameters),
        ("testRobotReport", testRobotReport),
        ("testRobotLeft", testRobotLeft),
        ("testRobotRight", testRobotRight),
        ("testRobotMove", testRobotMove),
        ("testRobotMoveEast", testRobotMoveEast),
        ("testRobotMoveWest", testRobotMoveWest),
        ("testRobotMoveSouth", testRobotMoveSouth),
        ("testRobotPlace", testRobotPlace),
        ("testRobotCannotMoveOffTableAt40South", testRobotCannotMoveOffTableAt40South),
        ("testRobotCannotMoveOffTableAt40East", testRobotCannotMoveOffTableAt40East),
        ("testRobotCannotMoveOffTableAt44North", testRobotCannotMoveOffTableAt44North),
        ("testRobotCannotMoveOffTableAt44East", testRobotCannotMoveOffTableAt44East),
        ("testRobotCannotMoveOffTableAt04West", testRobotCannotMoveOffTableAt04West),
        ("testRobotCannotMoveOffTableAt04North", testRobotCannotMoveOffTableAt04North),
        ("testRobotExecReport", testRobotExecReport),
        ("testMain", testMain),
        ("testMainFileInputExampleA", testMainFileInputExampleA),
        ("testMainFileInputExampleB", testMainFileInputExampleB),
    ]
}
