protocol DirectionProtocol: CommandProtocol {
  var rawValue: String { get }
  var left: DirectionProtocol { get }
  var right: DirectionProtocol { get }
}
