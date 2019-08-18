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
    switch face {
    case .north:
      face = .west
    case .west:
      face = .south
    case .south:
      face = .east
    case .east:
      face = .north
    }
  }

  var position: Position {
    return Position(x: x, y: y, face: face)
  }

  enum Command: String {
    case turnLeft = "L"
  }
}
