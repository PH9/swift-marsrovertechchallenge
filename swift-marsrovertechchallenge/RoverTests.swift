import XCTest
@testable import swift_marsrovertechchallenge

class RoverTests: XCTestCase {

  let dummyX = 1
  let dummyY = 2
  
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

  func testWhenTurnRightDirectionShouldBeNextAfterClockwise() {
    let rover = Rover(x: dummyX, y: dummyY, face: .north)

    rover.operate(command: .turnRight)
    let expectedFaceWest = Position(x: dummyX, y: dummyY, face: .east)
    XCTAssertEqual(expectedFaceWest, rover.position)

    rover.operate(command: .turnRight)
    let expectedFaceSouth = Position(x: dummyX, y: dummyY, face: .south)
    XCTAssertEqual(expectedFaceSouth, rover.position)

    rover.operate(command: .turnRight)
    let expectedFaceEast = Position(x: dummyX, y: dummyY, face: .west)
    XCTAssertEqual(expectedFaceEast, rover.position)

    rover.operate(command: .turnRight)
    let expectedFaceNorth = Position(x: dummyX, y: dummyY, face: .north)
    XCTAssertEqual(expectedFaceNorth, rover.position)
  }

  func testWhenFaceNorthAndMoveShouldBeInNextPosition() {
    let rover = Rover(x: 1, y: 2, face: .north)
    rover.operate(command: .move)

    let expectedPosition = Position(x: 1, y: 3, face: .north)
    XCTAssertEqual(expectedPosition, rover.position)
  }

  func testWhenMoveShouldBeInTheSamePositionIfReachMaxY() {
    let rover = Rover(x: 1, y: 2, face: .north)
    let maps = Maps(maxX: 1, maxY: 2)
    rover.maps = maps
    rover.operate(command: .move)

    let expectedPosition = Position(x: 1, y: 2, face: .north)
    XCTAssertEqual(expectedPosition, rover.position)
  }

  func testWhenFaceEastAndMoveShouldBeInNextPosition() {
    let rover = Rover(x: 1, y: 2, face: .east)
    rover.operate(command: .move)

    let expectedPosition = Position(x: 2, y: 2, face: .east)
    XCTAssertEqual(expectedPosition, rover.position)
  }

  func testWhenMoveShouldBeInTheSamePositionIfReachMaxX() {
    let rover = Rover(x: 1, y: 2, face: .east)
    let maps = Maps(maxX: 1, maxY: 2)
    rover.maps = maps
    rover.operate(command: .move)

    let expectedPosition = Position(x: 1, y: 2, face: .east)
    XCTAssertEqual(expectedPosition, rover.position)
  }

  func testWhenFaceSouthAndMoveShouldBeInNextPosition() {
    let rover = Rover(x: 1, y: 2, face: .south)
    rover.operate(command: .move)

    let expectedPosition = Position(x: 1, y: 1, face: .south)
    XCTAssertEqual(expectedPosition, rover.position)
  }

  func testWhenMoveShouldBeInTheSamePositionIfReachMinY() {
    let rover = Rover(x: 1, y: 0, face: .south)
    let maps = Maps(maxX: dummyX, maxY: dummyY)
    rover.maps = maps
    rover.operate(command: .move)

    let expectedPosition = Position(x: 1, y: 0, face: .south)
    XCTAssertEqual(expectedPosition, rover.position)
  }

  func testWhenFaceWestAndMoveShouldBeInNextPosition() {
    let rover = Rover(x: 1, y: 2, face: .west)
    rover.operate(command: .move)

    let expectedPosition = Position(x: 0, y: 2, face: .west)
    XCTAssertEqual(expectedPosition, rover.position)
  }

  func testWhenMoveShouldBeInTheSamePositionIfReachMinX() {
    let rover = Rover(x: 0, y: 2, face: .west)
    let maps = Maps(maxX: dummyX, maxY: dummyY)
    rover.maps = maps
    rover.operate(command: .move)

    let expectedPosition = Position(x: 0, y: 2, face: .west)
    XCTAssertEqual(expectedPosition, rover.position)
  }

  func testRawValueOfRoverCommandShouldBeIntegrity() {
    XCTAssertEqual("L", Rover.Command.turnLeft.rawValue)
    XCTAssertEqual("R", Rover.Command.turnRight.rawValue)
    XCTAssertEqual("M", Rover.Command.move.rawValue)
  }
}
