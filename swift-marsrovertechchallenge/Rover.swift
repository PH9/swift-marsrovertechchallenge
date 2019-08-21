class Rover: CustomDebugStringConvertible {

  var maps: Maps?
  private(set) var position: Position

  init(x: Int, y: Int, face: DirectionProtocol) {
    position = Position(x: x, y: y, face: face)
  }

  @discardableResult
  func operate(command: CommandProtocol) -> Position {
    position = command.move(from: position, with: maps)
    return position
  }

  @discardableResult
  func operate(commands: [CommandProtocol]) -> Position {
    for command in commands {
      position = command.move(from: position, with: maps)
    }

    return position
  }

  var debugDescription: String {
    return """
    maps: \(maps),
    position: \(position)
"""
  }
}
