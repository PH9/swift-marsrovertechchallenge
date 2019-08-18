protocol CommandProtocol {
  func move(form position: Position, with maps: Maps?) -> Position
}
