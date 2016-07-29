import XCTest

class RandomGeneratorTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = RandomGenerator()
		XCTAssertNotNil(dataStructure.filter())
	}

}