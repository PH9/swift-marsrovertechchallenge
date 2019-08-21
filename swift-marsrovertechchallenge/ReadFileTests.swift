import XCTest
@testable import swift_marsrovertechchallenge

class ReadFileTests: XCTestCase {

  func testReadFile() {
    let string = try? Utils().readFile(name: "for-test.txt")
    XCTAssertEqual(
      """
5 5
1 2 N
LMLMLMLMM
3 3 E
MMRMMRMRRM
4 4 S
MMMRRLLXXLM

""", string)
  }
}
