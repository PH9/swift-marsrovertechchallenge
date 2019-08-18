class Rover: CustomDebugStringConvertible {

  var maps: Maps?
  private(set) var position: Position

  init(x: Int, y: Int, face: DirectionProtocol) {
    position = Position(x: x, y: y, face: face)
  }

  func operate(command: CommandProtocol) {
    position = command.move(from: position, with: maps)
  }

  func operate(commands: [CommandProtocol]) {
    for command in commands {
      position = command.move(from: position, with: maps)
    }
  }

  var debugDescription: String {
    return """
    maps: \(maps),
    position: \(position)
"""
  }
}
