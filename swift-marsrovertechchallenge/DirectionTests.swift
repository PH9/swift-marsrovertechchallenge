import XCTest
@testable import swift_marsrovertechchallenge

class DirectionTests: XCTestCase {

    func testDirectionRawValue() {
      XCTAssertEqual("N", North().rawValue)
      XCTAssertEqual("W", West().rawValue)
      XCTAssertEqual("S", South().rawValue)
      XCTAssertEqual("E", East().rawValue)
    }
}
