import XCTest

class RadialGradientTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = RadialGradient(radius0: 5, radius1: 100, color0: CIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), color1: CIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0), center: CIVector(values: [150.0, 150.0], count: 2))
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIRadialGradient")
		XCTAssertEqual(dataStructure.radius0, compareFilter?.valueForKey("inputRadius0") as? NSNumber)
		XCTAssertEqual(dataStructure.radius1, compareFilter?.valueForKey("inputRadius1") as? NSNumber)
		XCTAssertEqual(dataStructure.color0, compareFilter?.valueForKey("inputColor0") as? CIColor)
		XCTAssertEqual(dataStructure.color1, compareFilter?.valueForKey("inputColor1") as? CIColor)
		XCTAssertEqual(dataStructure.center, compareFilter?.valueForKey("inputCenter") as? CIVector)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputRadius0") as? NSNumber, compareFilter?.valueForKey("inputRadius0") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputRadius1") as? NSNumber, compareFilter?.valueForKey("inputRadius1") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputColor0") as? CIColor, compareFilter?.valueForKey("inputColor0") as? CIColor)
		XCTAssertEqual(generatedFilter?.valueForKey("inputColor1") as? CIColor, compareFilter?.valueForKey("inputColor1") as? CIColor)
		XCTAssertEqual(generatedFilter?.valueForKey("inputCenter") as? CIVector, compareFilter?.valueForKey("inputCenter") as? CIVector)
	}

}