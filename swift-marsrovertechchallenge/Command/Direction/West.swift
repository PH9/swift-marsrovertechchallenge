struct West: DirectionProtocol {

  let rawValue: String = "W"

  var left: DirectionProtocol {
    return South()
  }

  var right: DirectionProtocol {
    return North()
  }

  func move(form position: Position, with maps: Maps?) -> Position {
    let calculatedX = position.x - 1
    let newX = calculatedX < 0 ? 0 : calculatedX
    return Position(x: newX, y: position.y, face: position.face)
  }
}
