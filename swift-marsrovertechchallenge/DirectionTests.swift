import XCTest
@testable import swift_marsrovertechchallenge

class DirectionTests: XCTestCase {

    func testDirectionRawValue() {
      XCTAssertEqual("N", Direction.north.rawValue)
      XCTAssertEqual("W", Direction.west.rawValue)
      XCTAssertEqual("S", Direction.south.rawValue)
      XCTAssertEqual("E", Direction.east.rawValue)
    }
}
