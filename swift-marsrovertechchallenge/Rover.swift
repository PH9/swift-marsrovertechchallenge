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

  func operate(command: CommandProtocol) {
    let position = Position(x: x, y: y, face: face)
    let newPosition = command.move(form: position, with: maps)
    x = newPosition.x
    y = newPosition.y
    face = newPosition.face
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
}

protocol CommandProtocol {
  func move(form position: Position, with maps: Maps?) -> Position
}

struct TurnLeft: CommandProtocol {

  func move(form position: Position, with maps: Maps?) -> Position {
    return Position(x: position.x, y: position.y, face: position.face.left)
  }
}

struct TurnRight: CommandProtocol {

  func move(form position: Position, with maps: Maps?) -> Position {
    return Position(x: position.x, y: position.y, face: position.face.right)
  }
}

struct Move: CommandProtocol {

  func move(form position: Position, with maps: Maps?) -> Position {
    return position.face.move(form: position, with: maps)
  }
}
