import XCTest
@testable import swift_marsrovertechchallenge

class NorthTests: XCTestCase {

  func testLeftOfNorth_shouldBeWest() {
    let actual = North().left
    XCTAssertTrue(actual is West)
  }

  func testRightOfNorth_shouldBeEast() {
    let actual = North().right
    XCTAssertTrue(actual is East)
  }
}
