import XCTest
@testable import swift_marsrovertechchallenge

class RoverTests: XCTestCase {

  let dummyX = 1
  let dummyY = 2

  class SpyCommand: CommandProtocol {

    private(set) var moveCalledCount = 0

    func move(form position: Position, with maps: Maps?) -> Position {
      moveCalledCount += 1
      return Position(x: 8, y: 9, face: South())
    }
  }

  func testIsCalledMoveAndSetBack() {
    let rover = Rover(x: 1, y: 2, face: North())
    let spy = SpyCommand()
    rover.operate(command: spy)

    XCTAssertEqual(1, spy.moveCalledCount)
    XCTAssertEqual(8, rover.position.x)
    XCTAssertEqual(9, rover.position.y)
    XCTAssertTrue(rover.position.face is South)
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
