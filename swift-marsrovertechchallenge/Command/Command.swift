enum CommandFactoryError: Error {
  case cannotCreateBundle
  case classNotFound(for: String)
  case classIsNotNSObject(for: String)
  case classDoesNotConformToCommandProtocol(for: String)
}

class CommandFactory {

  func create(rawValue: String) throws -> CommandProtocol {
    guard let namespace = Bundle(for: type(of: self)).infoDictionary?["CFBundleExecutable"] as? String else {
      throw CommandFactoryError.cannotCreateBundle
    }

    guard let anyClassType = NSClassFromString("\(namespace).\(rawValue)") else {
      throw CommandFactoryError.classNotFound(for: rawValue)
    }

    guard let objectType: NSObject.Type = anyClassType as? NSObject.Type else {
      throw CommandFactoryError.classIsNotNSObject(for: rawValue)
    }

    guard let command = objectType.init() as? CommandProtocol else {
      throw CommandFactoryError.classDoesNotConformToCommandProtocol(for: rawValue)
    }

    return command
  }
}

class TurnLeft: NSObject, CommandProtocol {

  func move(from position: Position, with maps: Maps?) -> Position {
    return Position(x: position.x, y: position.y, face: position.face.left)
  }
}

class L: TurnLeft {
  
}

class TurnRight: NSObject, CommandProtocol {

  func move(from position: Position, with maps: Maps?) -> Position {
    return Position(x: position.x, y: position.y, face: position.face.right)
  }
}

class R: TurnRight {

}


class Move: NSObject, CommandProtocol {

  func move(from position: Position, with maps: Maps?) -> Position {
    return position.face.move(from: position, with: maps)
  }
}

class M: Move {
  
}
