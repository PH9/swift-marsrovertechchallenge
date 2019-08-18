class CommandFactory {

  func create(rawValue: String) -> CommandProtocol {
    let namespace = Bundle(for: type(of: self)).infoDictionary!["CFBundleExecutable"] as! String
    let a: AnyClass! = NSClassFromString("\(namespace).\(rawValue)")
    let o: NSObject.Type! = a as! NSObject.Type?
    return o.init() as! CommandProtocol
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
