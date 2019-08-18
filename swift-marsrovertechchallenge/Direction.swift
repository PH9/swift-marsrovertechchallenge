protocol DirectionProtocol: CommandProtocol {
  var rawValue: String { get }
  var left: DirectionProtocol { get }
  var right: DirectionProtocol { get }
}

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

struct East: DirectionProtocol {

  let rawValue = "E"

  var left: DirectionProtocol {
    return North()
  }

  var right: DirectionProtocol {
    return South()
  }

  func move(form position: Position, with maps: Maps?) -> Position {
    let calculatedX = position.x + 1
    let newX = calculatedX > (maps?.maxX ?? Int.max) ? position.x : calculatedX
    return Position(x: newX, y: position.y, face: position.face)
  }
}

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
