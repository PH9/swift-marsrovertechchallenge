import XCTest
@testable import swift_marsrovertechchallenge

class PositionTests: XCTestCase {

  func testShouldBeEqualWhenValueAreAllTheSame() {
    let leftPosition = Position(x: 12, y: 99, face: North())
    let rightPosition = Position(x: 12, y: 99, face: North())
    XCTAssertTrue(leftPosition == rightPosition)
  }

  func testShouldNotBeEqualWhenAnyValueIsNotTheSame() {
    let x0y99North = Position(x: 0, y: 99, face: North())
    let x0y99South = Position(x: 0, y: 99, face: South())
    XCTAssertFalse(x0y99North == x0y99South)

    let x0y88North = Position(x: 0, y: 88, face: North())
    XCTAssertFalse(x0y99North == x0y88North)

    let x77y99North = Position(x: 77, y: 99, face: North())
    XCTAssertFalse(x0y99North == x77y99North)
  }
}
