protocol DirectionProtocol: CommandProtocol {
  var rawValue: String { get }
  var left: DirectionProtocol { get }
  var right: DirectionProtocol { get }
}

class DirectionFactory {

  static func create(rawValue: String) -> DirectionProtocol {
    switch rawValue {
    case "N":
      return North()
    case "E":
      return East()
    case "S":
      return South()
    case "W":
      return West()
    default:
      fatalError("No direction support with \(rawValue)")
    }
  }
}
