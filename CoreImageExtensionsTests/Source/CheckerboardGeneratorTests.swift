import XCTest

class CheckerboardGeneratorTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = CheckerboardGenerator(width: 80, color1: CIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0), color0: CIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), sharpness: 1, center: CIVector(values: [150.0, 150.0], count: 2))
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CICheckerboardGenerator")
		XCTAssertEqual(dataStructure.width, compareFilter?.valueForKey("inputWidth") as? NSNumber)
		XCTAssertEqual(dataStructure.color1, compareFilter?.valueForKey("inputColor1") as? CIColor)
		XCTAssertEqual(dataStructure.color0, compareFilter?.valueForKey("inputColor0") as? CIColor)
		XCTAssertEqual(dataStructure.sharpness, compareFilter?.valueForKey("inputSharpness") as? NSNumber)
		XCTAssertEqual(dataStructure.center, compareFilter?.valueForKey("inputCenter") as? CIVector)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputWidth") as? NSNumber, compareFilter?.valueForKey("inputWidth") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputColor1") as? CIColor, compareFilter?.valueForKey("inputColor1") as? CIColor)
		XCTAssertEqual(generatedFilter?.valueForKey("inputColor0") as? CIColor, compareFilter?.valueForKey("inputColor0") as? CIColor)
		XCTAssertEqual(generatedFilter?.valueForKey("inputSharpness") as? NSNumber, compareFilter?.valueForKey("inputSharpness") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputCenter") as? CIVector, compareFilter?.valueForKey("inputCenter") as? CIVector)
	}

}