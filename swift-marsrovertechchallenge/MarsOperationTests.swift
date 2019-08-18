import XCTest
@testable import swift_marsrovertechchallenge

class MarsOperationTests: XCTestCase {

  func testRunOperation() {
    let operation = MarsOperation(fileName: "for-test.txt")
    let result = operation.run()
    XCTAssertEqual("""
1 3 N
5 1 E
""", result)
  }
}
