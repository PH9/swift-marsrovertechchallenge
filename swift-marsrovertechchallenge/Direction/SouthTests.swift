import XCTest
@testable import swift_marsrovertechchallenge

class SouthTests: XCTestCase {

  func testLeftOfSouth_shouldBeEast() {
    let actual = South().left
    XCTAssertTrue(actual is East)
  }

  func testRightOfSouth_shouldBeWest() {
    let actual = South().right
    XCTAssertTrue(actual is West)
  }
}
