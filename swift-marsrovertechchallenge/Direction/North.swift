struct North: DirectionProtocol {

  let rawValue = "N"

  var left: DirectionProtocol {
    return West()
  }

  var right: DirectionProtocol {
    return East()
  }

  func move(form position: Position, with maps: Maps?) -> Position {
    let calculatedY = position.y + 1
    let newY = calculatedY > (maps?.maxY ?? Int.max) ? position.y : calculatedY
    return Position(x: position.x, y: newY, face: position.face)
  }
}
