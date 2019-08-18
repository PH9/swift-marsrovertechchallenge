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

  func testMove() {
    let position = Position(x: 1, y: 2, face: North())
    let newPosition = North().move(form: position, with: nil)
    let expectedPosition = Position(x: 1, y: 3, face: North())
    XCTAssertEqual(expectedPosition, newPosition)
  }

  func testMoveAndReachMaxY_shouldBeTheSamePositionAsBefore() {
    let position = Position(x: 1, y: 99, face: North())
    let maps = Maps(maxX: 88, maxY: 99)
    let newPosition = North().move(form: position, with: maps)
    XCTAssertEqual(position, newPosition)
  }
}
