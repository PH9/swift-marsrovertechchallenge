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

  func testMove() {
    let roverPosition = Position(x: 1, y: 2, face: South())
    let newPosition = South().move(form: roverPosition, with: nil)
    let expectedPosition = Position(x: 1, y: 1, face: South())
    XCTAssertEqual(expectedPosition, newPosition)
  }

  func testMove_withLimite() {
    let roverPosition = Position(x: 1, y: 0, face: South())
    let maps = Maps(maxX: 1, maxY: 2)
    let newPosition = South().move(form: roverPosition, with: maps)
    XCTAssertEqual(roverPosition, newPosition)
  }
}
