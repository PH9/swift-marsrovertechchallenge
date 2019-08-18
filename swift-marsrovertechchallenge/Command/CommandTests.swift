import XCTest
@testable import swift_marsrovertechchallenge

class CommandTests: XCTestCase {

  func testTurnLeft() {
    let position = Position(x: 88, y: 99, face: East())
    let actualPosition = TurnLeft().move(from: position, with: nil)
    let expectedFace = position.face.left
    XCTAssertTrue(type(of: expectedFace) == type(of: actualPosition.face))
  }

  func testTurnRight() {
    let position = Position(x: 88, y: 99, face: South())
    let actualPosition = TurnRight().move(from: position, with: nil)
    let expectedFace = position.face.right
    XCTAssertTrue(type(of: expectedFace) == type(of: actualPosition.face))
  }

  func testMove() {
    let position = Position(x: 0, y: 0, face: North())
    let actualPosition = Move().move(from: position, with: nil)
    let expectedPosition = position.face.move(from: position, with: nil)
    XCTAssertEqual(expectedPosition, actualPosition)
  }
}
