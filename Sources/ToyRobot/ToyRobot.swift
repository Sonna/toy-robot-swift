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

        func report(_ _args: String = "") {
          print("\(x), \(y), \(facing)")
        }

        func left(_ _args: String = "") {
          facing = TURN[facing]!["LEFT"]!
        }

        func right(_ _args: String = "") {
          facing = TURN[facing]!["RIGHT"]!
        }

        func move(_ _args: String = "") {
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

        func exec(_ command: String, _ args: String = "") {
          switch command {
            case "PLACE": place(args)
            case "MOVE": move(args)
            case "LEFT": left(args)
            case "RIGHT": right(args)
            case "REPORT": report(args)
            default: break // Do nothing
          }
        }
    }

    static func main() {
      let robot = ToyRobot.Robot()
      var command: String = ""
      var args: String = ""

      while command != "EXIT" {
          if let line = readLine() {
              var input = line.split(separator: " ").map { String($0) }
              command = input[0]

              if input.count > 1 {
                  args = input[1]
              }

              robot.exec(command, args)
          }
      }

    }
}
