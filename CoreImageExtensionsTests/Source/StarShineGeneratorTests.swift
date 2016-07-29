import XCTest

class StarShineGeneratorTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = StarShineGenerator(center: CIVector(values: [150.0, 150.0], count: 2), epsilon: -2, radius: 50, color: CIColor(red: 1.0, green: 0.8, blue: 0.6, alpha: 1.0), crossScale: 15, crossWidth: 2.5, crossAngle: 0.6, crossOpacity: -2)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIStarShineGenerator")
		XCTAssertEqual(dataStructure.center, compareFilter?.valueForKey("inputCenter") as? CIVector)
		XCTAssertEqual(dataStructure.epsilon, compareFilter?.valueForKey("inputEpsilon") as? NSNumber)
		XCTAssertEqual(dataStructure.radius, compareFilter?.valueForKey("inputRadius") as? NSNumber)
		XCTAssertEqual(dataStructure.color, compareFilter?.valueForKey("inputColor") as? CIColor)
		XCTAssertEqual(dataStructure.crossScale, compareFilter?.valueForKey("inputCrossScale") as? NSNumber)
		XCTAssertEqual(dataStructure.crossWidth, compareFilter?.valueForKey("inputCrossWidth") as? NSNumber)
		XCTAssertEqual(dataStructure.crossAngle, compareFilter?.valueForKey("inputCrossAngle") as? NSNumber)
		XCTAssertEqual(dataStructure.crossOpacity, compareFilter?.valueForKey("inputCrossOpacity") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputCenter") as? CIVector, compareFilter?.valueForKey("inputCenter") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputEpsilon") as? NSNumber, compareFilter?.valueForKey("inputEpsilon") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputRadius") as? NSNumber, compareFilter?.valueForKey("inputRadius") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputColor") as? CIColor, compareFilter?.valueForKey("inputColor") as? CIColor)
		XCTAssertEqual(generatedFilter?.valueForKey("inputCrossScale") as? NSNumber, compareFilter?.valueForKey("inputCrossScale") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputCrossWidth") as? NSNumber, compareFilter?.valueForKey("inputCrossWidth") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputCrossAngle") as? NSNumber, compareFilter?.valueForKey("inputCrossAngle") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputCrossOpacity") as? NSNumber, compareFilter?.valueForKey("inputCrossOpacity") as? NSNumber)
	}

}