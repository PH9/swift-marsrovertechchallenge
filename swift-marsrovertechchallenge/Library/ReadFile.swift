enum ReadFileError: Error {
  case cannotCreateURLFromName
}

class Utils {

  func readFile(name: String) throws -> String {
    let bundle = Bundle(for: type(of: self))
    guard let url = bundle.url(forResource: name, withExtension: nil) else {
      throw ReadFileError.cannotCreateURLFromName
    }

    let string = try String(contentsOf: url)

    return string
  }
}
