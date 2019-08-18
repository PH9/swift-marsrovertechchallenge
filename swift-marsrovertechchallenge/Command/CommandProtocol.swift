protocol CommandProtocol {
  func move(from position: Position, with maps: Maps?) -> Position
}
