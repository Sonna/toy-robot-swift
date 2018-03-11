struct ToyRobot {
    var text = "Hello, World!"

    class Robot {
        // let MOVE: [String: [String: Int]] = [
        let MOVE = [
          "NORTH": ["x": 0, "y": 1],
          "SOUTH": ["x": 0, "y": -1],
          "EAST": ["x": 1, "y": 0],
          "WEST": ["x": -1, "y": 0]
        ]

        // let SEPARATORS_REGEX = "[ |,\\s*]"

        // let TURN: [String: [String: String]] = [
        let TURN = [
          "NORTH": ["LEFT": "WEST", "RIGHT": "EAST"],
          "SOUTH": ["LEFT": "EAST", "RIGHT": "WEST"],
          "EAST": ["LEFT": "NORTH", "RIGHT": "SOUTH"],
          "WEST": ["LEFT": "SOUTH", "RIGHT": "NORTH"]
        ]

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

        func left(_args: String = "") {
          facing = TURN[facing]!["LEFT"]!
        }

        func right(_args: String = "") {
          facing = TURN[facing]!["RIGHT"]!
        }

        func move(_args: String = "") {
          x += MOVE[facing]!["x"]!
          y += MOVE[facing]!["y"]!

          if (x < 0 || x > 4) {
            x -= MOVE[facing]!["x"]!
          }

          if (y < 0 || y > 4) {
            y -= MOVE[facing]!["y"]!
          }
        }

        func place(_ coordinate: String) {
          // let (dx, dy, dFacing) = coordinate.split(separator: ",")
          let coordinates = coordinate.split(separator: ",").map { String($0) }
          x = Int(coordinates[0])!
          y = Int(coordinates[1])!
          facing = coordinates[2]
        }
    }
}
