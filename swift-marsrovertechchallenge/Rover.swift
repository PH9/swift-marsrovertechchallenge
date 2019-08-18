class Rover {
  
  var maps: Maps?
  private(set) var position: Position

  init(x: Int, y: Int, face: DirectionProtocol) {
    position = Position(x: x, y: y, face: face)
  }

  func operate(command: CommandProtocol) {
    position = command.move(form: position, with: maps)
  }
}
