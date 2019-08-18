import XCTest
@testable import swift_marsrovertechchallenge

class RoverTests: XCTestCase {

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
}
