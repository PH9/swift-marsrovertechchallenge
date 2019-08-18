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

  func testMove() {
    let position = Position(x: 1, y: 2, face: West())
    let newPosition = West().move(form: position, with: nil)
    let expectedPosition = Position(x: 0, y: 2, face: West())
    XCTAssertEqual(expectedPosition, newPosition)
  }

  func testMoveAndReachMinX_shouldBeTheSamePositionAsBefore() {
    let position = Position(x: 0, y: 55, face: West())
    let maps = Maps(maxX: 88, maxY: 99)
    let newPosition = West().move(form: position, with: maps)
    XCTAssertEqual(position, newPosition)
  }
}
