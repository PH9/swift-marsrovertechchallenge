import XCTest
@testable import swift_marsrovertechchallenge

class WestTests: XCTestCase {

  func testLeftOfWest_shouldBeSouth() {
    let actual = West().left
    XCTAssertTrue(actual is South)
  }

  func testRightOfWest_shouldBeNorth() {
    let actual = West().right
    XCTAssertTrue(actual is North)
  }
}
