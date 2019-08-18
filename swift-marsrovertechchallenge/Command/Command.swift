struct TurnLeft: CommandProtocol {

  func move(from position: Position, with maps: Maps?) -> Position {
    return Position(x: position.x, y: position.y, face: position.face.left)
  }
}

struct TurnRight: CommandProtocol {

  func move(from position: Position, with maps: Maps?) -> Position {
    return Position(x: position.x, y: position.y, face: position.face.right)
  }
}

struct Move: CommandProtocol {

  func move(from position: Position, with maps: Maps?) -> Position {
    return position.face.move(from: position, with: maps)
  }
}
