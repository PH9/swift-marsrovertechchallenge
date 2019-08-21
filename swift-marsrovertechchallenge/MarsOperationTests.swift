import XCTest
@testable import swift_marsrovertechchallenge

class MarsOperationTests: XCTestCase {

  func testRunOperation() {
    let operation = try! MarsOperation(fileName: "for-test.txt")
    let actual = operation.run()
    let expectedPositions = [
        Position(x: 1, y: 3, face: North()),
        Position(x: 5, y: 1, face: East())
    ]

    XCTAssertEqual(expectedPositions, actual)
  }
}
