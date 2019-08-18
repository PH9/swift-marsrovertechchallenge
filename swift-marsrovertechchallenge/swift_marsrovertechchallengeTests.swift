import XCTest
@testable import swift_marsrovertechchallenge

class swift_marsrovertechchallengeTests: XCTestCase {
  
  func test_create_maps() {
    let maps = Maps(maxX: 5, maxY: 5)
  }
  
  func testWhenRoverFaceNorth_afterTurnLeftShouldFaceWest() {
    let rover = Rover(x: 1, y: 2, face: .north)
    rover.operate(command: .turnLeft)

    let expectedPosition = Position(x: 1, y: 2, face: .west)
    XCTAssertEqual(expectedPosition, rover.position)
  }
  
  func testWhenRoverFaceWest_afterTurnLeftShouldFaceSouth() {
    let rover = Rover(x: 1, y: 2, face: .west)
    rover.operate(command: .turnLeft)
    
    let expectedPosition = Position(x: 1, y: 2, face: .south)
    XCTAssertEqual(expectedPosition, rover.position)
  }
}
