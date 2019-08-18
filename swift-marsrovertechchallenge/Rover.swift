class Rover {
  
  var maps: Maps?
  private var x: Int
  private var y: Int
  private var face: Direction

  init(x: Int, y: Int, face: Direction) {
    self.x = x
    self.y = y
    self.face = face
  }

  func operate(command: Command) {
    switch command {
    case .turnLeft:
      operateTurnLeftCommand()
    case .turnRight:
      operateTurnRightCommand()
    case .move:
      if face == .east {
        x += 1
        return
      } else if face == .south {
        y -= 1
        return
      } else if face == .west {
        x -= 1
        return
      }
      if y + 1 <= maps?.maxY ?? Int.max {
        y += 1
      }
    }
  }

  func operateTurnLeftCommand() {
    face = face.nextCounterclockwise
  }

  func operateTurnRightCommand() {
    face = face.nextClockwise
  }

  var position: Position {
    return Position(x: x, y: y, face: face)
  }

  enum Command: String {
    case turnLeft = "L"
    case turnRight = "R"
    case move = "M"
  }
}
