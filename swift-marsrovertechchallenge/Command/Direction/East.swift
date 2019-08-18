struct East: DirectionProtocol {

  let rawValue = "E"

  var left: DirectionProtocol {
    return North()
  }

  var right: DirectionProtocol {
    return South()
  }

  func move(from position: Position, with maps: Maps?) -> Position {
    let calculatedX = position.x + 1
    let newX = calculatedX > (maps?.maxX ?? Int.max) ? position.x : calculatedX
    return Position(x: newX, y: position.y, face: position.face)
  }
}
