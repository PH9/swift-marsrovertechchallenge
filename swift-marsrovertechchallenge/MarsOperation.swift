typealias Operations = [(Rover, [CommandProtocol])]

class MarsOperation {

  let maps: Maps
  let operations: Operations

  init(fileName: String) throws {
    let string = (try Utils().readFile(name: fileName)).withoutNewlines

    let mapsMax = string[0].components(separatedBy: " ")
    self.maps = Maps(maxX: Int(mapsMax[0])!, maxY: Int(mapsMax[1])!)

    self.operations = MarsOperation.convertStringToOperations(string: string, with: maps)
  }

  private static func convertStringToOperations(string: [Substring], with maps: Maps) -> Operations {
    var operations: [(Rover, [CommandProtocol])] = []
    for i in 1 ..< string.count where i % 2 != 0 {
      let s = string[i].split(separator: " ")
      let rover = Rover(x: Int(s[0])!, y: Int(s[1])!, face: DirectionFactory.create(rawValue: String(s[2])))
      rover.maps = maps

      let c = string[i + 1]
      let commands: [CommandProtocol] = c.compactMap { c -> CommandProtocol? in
        return try? CommandFactory().create(rawValue: String(c))
      }

      operations.append((rover, commands))
    }

    return operations
  }

  func run() -> [Position] {
    let result = operations.compactMap { rover -> Position in
      return rover.0.operate(commands: rover.1)
    }

    return result
  }
}
