import XCTest

class LinearGradientTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = LinearGradient(point1: CIVector(values: [200.0, 200.0], count: 2), color1: CIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0), color0: CIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), point0: CIVector(values: [0.0, 0.0], count: 2))
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CILinearGradient")
		XCTAssertEqual(dataStructure.point1, compareFilter?.valueForKey("inputPoint1") as? CIVector)
		XCTAssertEqual(dataStructure.color1, compareFilter?.valueForKey("inputColor1") as? CIColor)
		XCTAssertEqual(dataStructure.color0, compareFilter?.valueForKey("inputColor0") as? CIColor)
		XCTAssertEqual(dataStructure.point0, compareFilter?.valueForKey("inputPoint0") as? CIVector)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputPoint1") as? CIVector, compareFilter?.valueForKey("inputPoint1") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputColor1") as? CIColor, compareFilter?.valueForKey("inputColor1") as? CIColor)
		XCTAssertEqual(generatedFilter?.valueForKey("inputColor0") as? CIColor, compareFilter?.valueForKey("inputColor0") as? CIColor)
		XCTAssertEqual(generatedFilter?.valueForKey("inputPoint0") as? CIVector, compareFilter?.valueForKey("inputPoint0") as? CIVector)
	}

}