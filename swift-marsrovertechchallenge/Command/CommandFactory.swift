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
