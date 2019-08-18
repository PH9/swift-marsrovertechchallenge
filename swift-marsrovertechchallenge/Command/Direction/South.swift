struct South: DirectionProtocol {

  let rawValue = "S"


  var left: DirectionProtocol {
    return East()
  }

  var right: DirectionProtocol {
    return West()
  }

  func move(form position: Position, with maps: Maps?) -> Position {
    let calculatedY = position.y - 1
    let newY = calculatedY < 0 ? 0 : calculatedY
    return Position(x: position.x, y: newY, face: position.face)
  }
}
