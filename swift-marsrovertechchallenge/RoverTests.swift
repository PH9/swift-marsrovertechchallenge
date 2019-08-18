import XCTest
@testable import swift_marsrovertechchallenge

class RoverTests: XCTestCase {

  let dummyX = 1
  let dummyY = 2
  
  func testWhenTurnLeftDirectionShouldBeNextCounterclockwise() {
    let rover = Rover(x: dummyX, y: dummyY, face: North())

    rover.operate(command: TurnLeft())
    let expectedFaceWest = Position(x: dummyX, y: dummyY, face: West())
    XCTAssertEqual(expectedFaceWest, rover.position)

    rover.operate(command: TurnLeft())
    let expectedFaceSouth = Position(x: dummyX, y: dummyY, face: South())
    XCTAssertEqual(expectedFaceSouth, rover.position)

    rover.operate(command: TurnLeft())
    let expectedFaceEast = Position(x: dummyX, y: dummyY, face: East())
    XCTAssertEqual(expectedFaceEast, rover.position)

    rover.operate(command: TurnLeft())
    let expectedFaceNorth = Position(x: dummyX, y: dummyY, face: North())
    XCTAssertEqual(expectedFaceNorth, rover.position)
  }

  func testWhenTurnRightDirectionShouldBeNextAfterClockwise() {
    let rover = Rover(x: dummyX, y: dummyY, face: North())

    rover.operate(command: TurnRight())
    let expectedFaceWest = Position(x: dummyX, y: dummyY, face: East())
    XCTAssertEqual(expectedFaceWest, rover.position)

    rover.operate(command: TurnRight())
    let expectedFaceSouth = Position(x: dummyX, y: dummyY, face: South())
    XCTAssertEqual(expectedFaceSouth, rover.position)

    rover.operate(command: TurnRight())
    let expectedFaceEast = Position(x: dummyX, y: dummyY, face: West())
    XCTAssertEqual(expectedFaceEast, rover.position)

    rover.operate(command: TurnRight())
    let expectedFaceNorth = Position(x: dummyX, y: dummyY, face: North())
    XCTAssertEqual(expectedFaceNorth, rover.position)
  }

  func testWhenFaceNorthAndMoveShouldBeInNextPosition() {
    let rover = Rover(x: 1, y: 2, face: North())
    rover.operate(command: Move())

    let expectedPosition = Position(x: 1, y: 3, face: North())
    XCTAssertEqual(expectedPosition, rover.position)
  }

  func testWhenMoveShouldBeInTheSamePositionIfReachMaxY() {
    let rover = Rover(x: 1, y: 2, face: North())
    let maps = Maps(maxX: 1, maxY: 2)
    rover.maps = maps
    rover.operate(command: Move())

    let expectedPosition = Position(x: 1, y: 2, face: North())
    XCTAssertEqual(expectedPosition, rover.position)
  }

  func testWhenFaceEastAndMoveShouldBeInNextPosition() {
    let rover = Rover(x: 1, y: 2, face: East())
    rover.operate(command: Move())

    let expectedPosition = Position(x: 2, y: 2, face: East())
    XCTAssertEqual(expectedPosition, rover.position)
  }

  func testWhenMoveShouldBeInTheSamePositionIfReachMaxX() {
    let rover = Rover(x: 1, y: 2, face: East())
    let maps = Maps(maxX: 1, maxY: 2)
    rover.maps = maps
    rover.operate(command: Move())

    let expectedPosition = Position(x: 1, y: 2, face: East())
    XCTAssertEqual(expectedPosition, rover.position)
  }

  func testWhenFaceSouthAndMoveShouldBeInNextPosition() {
    let rover = Rover(x: 1, y: 2, face: South())
    rover.operate(command: Move())

    let expectedPosition = Position(x: 1, y: 1, face: South())
    XCTAssertEqual(expectedPosition, rover.position)
  }

  func testWhenMoveShouldBeInTheSamePositionIfReachMinY() {
    let rover = Rover(x: 1, y: 0, face: South())
    let maps = Maps(maxX: dummyX, maxY: dummyY)
    rover.maps = maps
    rover.operate(command: Move())

    let expectedPosition = Position(x: 1, y: 0, face: South())
    XCTAssertEqual(expectedPosition, rover.position)
  }

  func testWhenFaceWestAndMoveShouldBeInNextPosition() {
    let rover = Rover(x: 1, y: 2, face: West())
    rover.operate(command: Move())

    let expectedPosition = Position(x: 0, y: 2, face: West())
    XCTAssertEqual(expectedPosition, rover.position)
  }

  func testWhenMoveShouldBeInTheSamePositionIfReachMinX() {
    let rover = Rover(x: 0, y: 2, face: West())
    let maps = Maps(maxX: dummyX, maxY: dummyY)
    rover.maps = maps
    rover.operate(command: Move())

    let expectedPosition = Position(x: 0, y: 2, face: West())
    XCTAssertEqual(expectedPosition, rover.position)
  }
}
