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

  func testMove() {
    let position = Position(x: 1, y: 2, face: East())
    let newPosition = East().move(form: position, with: nil)
    let expectedPosition = Position(x: 2, y: 2, face: East())
    XCTAssertEqual(expectedPosition, newPosition)
  }

  func testMoveAndReachMaxX_shouldBeTheSamePositionAsBefore() {
    let position = Position(x: 88, y: 55, face: East())
    let maps = Maps(maxX: 88, maxY: 99)
    let newPosition = East().move(form: position, with: maps)
    XCTAssertEqual(position, newPosition)
  }
}
