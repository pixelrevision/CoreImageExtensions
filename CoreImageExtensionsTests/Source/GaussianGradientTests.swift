import XCTest

class GaussianGradientTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = GaussianGradient(color1: CIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), color0: CIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), center: CIVector(values: [150.0, 150.0], count: 2), radius: 300)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIGaussianGradient")
		XCTAssertEqual(dataStructure.color1, compareFilter?.valueForKey("inputColor1") as? CIColor)
		XCTAssertEqual(dataStructure.color0, compareFilter?.valueForKey("inputColor0") as? CIColor)
		XCTAssertEqual(dataStructure.center, compareFilter?.valueForKey("inputCenter") as? CIVector)
		XCTAssertEqual(dataStructure.radius, compareFilter?.valueForKey("inputRadius") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputColor1") as? CIColor, compareFilter?.valueForKey("inputColor1") as? CIColor)
		XCTAssertEqual(generatedFilter?.valueForKey("inputColor0") as? CIColor, compareFilter?.valueForKey("inputColor0") as? CIColor)
		XCTAssertEqual(generatedFilter?.valueForKey("inputCenter") as? CIVector, compareFilter?.valueForKey("inputCenter") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputRadius") as? NSNumber, compareFilter?.valueForKey("inputRadius") as? NSNumber)
	}

}