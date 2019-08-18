import XCTest
@testable import swift_marsrovertechchallenge

class swift_marsrovertechchallengeTests: XCTestCase {

  let dummyX = 1
  let dummyY = 2
  
  func test_create_maps() {
    let maps = Maps(maxX: 5, maxY: 5)
  }
  
  func testWhenTurnLeftDirectionShouldBeNextCounterclockwise() {
    let rover = Rover(x: dummyX, y: dummyY, face: .north)

    rover.operate(command: .turnLeft)
    let expectedFaceWest = Position(x: dummyX, y: dummyY, face: .west)
    XCTAssertEqual(expectedFaceWest, rover.position)

    rover.operate(command: .turnLeft)
    let expectedFaceSouth = Position(x: dummyX, y: dummyY, face: .south)
    XCTAssertEqual(expectedFaceSouth, rover.position)

    rover.operate(command: .turnLeft)
    let expectedFaceEast = Position(x: dummyX, y: dummyY, face: .east)
    XCTAssertEqual(expectedFaceEast, rover.position)

    rover.operate(command: .turnLeft)
    let expectedFaceNorth = Position(x: dummyX, y: dummyY, face: .north)
    XCTAssertEqual(expectedFaceNorth, rover.position)
  }
}
