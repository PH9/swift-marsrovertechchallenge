extension String {

  var withoutNewlines: [Substring] {
    return self.split { $0.isNewline }.joined(separator: "\n").split(separator: "\n")
  }
}
