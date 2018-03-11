struct ToyRobot {
    var text = "Hello, World!"

    class Robot {
        var x: Int
        var y: Int
        var facing: String

        init(x: Int = 0, y: Int = 0, facing: String = "NORTH") {
          self.x = x
          self.y = y
          self.facing = facing
        }

        func report(_args: String = "") {
          print("\(x), \(y), \(facing)")
        }
    }
}
