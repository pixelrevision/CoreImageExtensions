import XCTest

class ConstantColorGeneratorTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = ConstantColorGenerator(color: CIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0))
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIConstantColorGenerator")
		XCTAssertEqual(dataStructure.color, compareFilter?.valueForKey("inputColor") as? CIColor)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputColor") as? CIColor, compareFilter?.valueForKey("inputColor") as? CIColor)
	}

}