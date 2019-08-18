class Rover {
  
  weak var maps: Maps?
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
    }
  }

  func operateTurnLeftCommand() {
    if face == .west {
      face = .south
      return
    } else if face == .south {
      face = .east
      return
    }
    face = .west
  }

  var position: Position {
    return Position(x: x, y: y, face: face)
  }

  enum Command: String {
    case turnLeft = "L"
  }
}
