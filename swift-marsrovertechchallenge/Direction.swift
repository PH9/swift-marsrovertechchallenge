enum Direction: String {
  case north = "N"
  case west = "W"
  case south = "S"
  case east = "E"

  var nextClockwise: Direction {
    switch self {
    case .north:
      return .east
    case .east:
      return .south
    case .south:
      return .west
    case .west:
      return .north
    }
  }
}
