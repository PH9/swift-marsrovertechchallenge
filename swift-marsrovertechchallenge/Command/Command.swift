class CommandFactory {

  static func create(rawValue: String) -> CommandProtocol {
    switch rawValue {
    case "L":
      return TurnLeft()
    case "R":
      return TurnRight()
    case "M":
      return Move()
    default:
      fatalError("Not support with comamnd \(rawValue)")
    }
  }
}

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
