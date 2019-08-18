struct Position: Equatable {
  let x: Int
  let y: Int
  let face: DirectionProtocol

  static func == (lhs: Position, rhs: Position) -> Bool {
    return lhs.x == rhs.x
      && lhs.y == rhs.y
      && lhs.face.rawValue == rhs.face.rawValue
  }
}
