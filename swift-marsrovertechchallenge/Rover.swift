class Rover {
  
  var maps: Maps?
  private var x: Int
  private var y: Int
  private var face: DirectionProtocol

  init(x: Int, y: Int, face: DirectionProtocol) {
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
      operateMoveCommand()
    }
  }

  func operateMoveCommand() {
    let position = face.move(form: self.position, with: maps)
    x = position.x
    y = position.y
  }

  func operateTurnLeftCommand() {
    face = face.left
  }

  func operateTurnRightCommand() {
    face = face.right
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
