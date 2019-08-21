class MarsOperation {

  let maps: Maps
  let rovers: [(Rover, [CommandProtocol])]

  init(fileName: String) {
    // Remove empty lines...
    let string = ((try! Utils().readFile(name: fileName)).split { $0.isNewline }).joined(separator: "\n").split(separator: "\n")
    let mapsMax = string[0].components(separatedBy: " ")
    self.maps = Maps(maxX: Int(mapsMax[0])!, maxY: Int(mapsMax[1])!)

    var rovers: [(Rover, [CommandProtocol])] = []
    for i in 1 ..< string.count where i % 2 != 0 {
      let s = string[i].split(separator: " ")
      let rover = Rover(x: Int(s[0])!, y: Int(s[1])!, face: DirectionFactory.create(rawValue: String(s[2])))
      rover.maps = maps

      let c = string[i + 1]
      let commands: [CommandProtocol] = c.compactMap { c -> CommandProtocol? in
        return try? CommandFactory().create(rawValue: String(c))
      }

      rovers.append((rover, commands))
    }

    self.rovers = rovers
  }

  func run() -> [Position] {
    let result = rovers.compactMap { rover -> Position in
      rover.0.operate(commands: rover.1)
        return rover.0.position
    }

    return result
  }
}
