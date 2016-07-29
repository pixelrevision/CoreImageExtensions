import XCTest

class LenticularHaloGeneratorTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = LenticularHaloGenerator(haloOverlap: 0.77, striationStrength: 0.5, center: CIVector(values: [150.0, 150.0], count: 2), time: 0, color: CIColor(red: 1.0, green: 0.9, blue: 0.8, alpha: 1.0), striationContrast: 1, haloWidth: 87, haloRadius: 70)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CILenticularHaloGenerator")
		XCTAssertEqual(dataStructure.haloOverlap, compareFilter?.valueForKey("inputHaloOverlap") as? NSNumber)
		XCTAssertEqual(dataStructure.striationStrength, compareFilter?.valueForKey("inputStriationStrength") as? NSNumber)
		XCTAssertEqual(dataStructure.center, compareFilter?.valueForKey("inputCenter") as? CIVector)
		XCTAssertEqual(dataStructure.time, compareFilter?.valueForKey("inputTime") as? NSNumber)
		XCTAssertEqual(dataStructure.color, compareFilter?.valueForKey("inputColor") as? CIColor)
		XCTAssertEqual(dataStructure.striationContrast, compareFilter?.valueForKey("inputStriationContrast") as? NSNumber)
		XCTAssertEqual(dataStructure.haloWidth, compareFilter?.valueForKey("inputHaloWidth") as? NSNumber)
		XCTAssertEqual(dataStructure.haloRadius, compareFilter?.valueForKey("inputHaloRadius") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputHaloOverlap") as? NSNumber, compareFilter?.valueForKey("inputHaloOverlap") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputStriationStrength") as? NSNumber, compareFilter?.valueForKey("inputStriationStrength") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputCenter") as? CIVector, compareFilter?.valueForKey("inputCenter") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputTime") as? NSNumber, compareFilter?.valueForKey("inputTime") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputColor") as? CIColor, compareFilter?.valueForKey("inputColor") as? CIColor)
		XCTAssertEqual(generatedFilter?.valueForKey("inputStriationContrast") as? NSNumber, compareFilter?.valueForKey("inputStriationContrast") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputHaloWidth") as? NSNumber, compareFilter?.valueForKey("inputHaloWidth") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputHaloRadius") as? NSNumber, compareFilter?.valueForKey("inputHaloRadius") as? NSNumber)
	}

}