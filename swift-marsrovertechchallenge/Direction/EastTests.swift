import XCTest
@testable import swift_marsrovertechchallenge

class EastTests: XCTestCase {

  func testLeftOfEast_shouldBeNorth() {
    let actual = East().left
    XCTAssertTrue(actual is North)
  }

  func testRightOfEast_shouldBeSouth() {
    let actual = East().right
    XCTAssertTrue(actual is South)
  }
}
