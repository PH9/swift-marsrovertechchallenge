import XCTest
@testable import swift_marsrovertechchallenge

class swift_marsrovertechchallengeTests: XCTestCase {

  let dummyX = 1
  let dummyY = 2
  
  func test_create_maps() {
    let maps = Maps(maxX: 5, maxY: 5)
  }
  
  func testWhenRoverFaceNorth_afterTurnLeftShouldFaceWest() {
    let rover = Rover(x: dummyX, y: dummyY, face: .north)
    rover.operate(command: .turnLeft)

    let expectedPosition = Position(x: dummyX, y: dummyY, face: .west)
    XCTAssertEqual(expectedPosition, rover.position)
  }
  
  func testWhenRoverFaceWest_afterTurnLeftShouldFaceSouth() {
    let rover = Rover(x: dummyX, y: dummyY, face: .west)
    rover.operate(command: .turnLeft)
    
    let expectedPosition = Position(x: dummyX, y: dummyY, face: .south)
    XCTAssertEqual(expectedPosition, rover.position)
  }
  
  func testWhenRoverFaceSouth_afterTurnLeftShouldFaceEast() {
    let rover = Rover(x: dummyX, y: dummyY, face: .south)
    rover.operate(command: .turnLeft)
    
    let expectedPosition = Position(x: dummyX, y: dummyY, face: .east)
    XCTAssertEqual(expectedPosition, rover.position)
  }

  func testWhenRoverFaceEast_afterTurnLeftShouldFaceNorth() {
    let rover = Rover(x: dummyX, y: dummyY, face: .east)
    rover.operate(command: .turnLeft)

    let expectedPosition = Position(x: dummyX, y: dummyY, face: .north)
    XCTAssertEqual(expectedPosition, rover.position)
  }
}
