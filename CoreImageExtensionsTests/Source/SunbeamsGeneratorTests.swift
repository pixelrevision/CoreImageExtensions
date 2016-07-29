import XCTest

class SunbeamsGeneratorTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = SunbeamsGenerator(sunRadius: 40, striationStrength: 0.5, center: CIVector(values: [150.0, 150.0], count: 2), maxStriationRadius: 2.58, time: 0, color: CIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), striationContrast: 1.375)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CISunbeamsGenerator")
		XCTAssertEqual(dataStructure.sunRadius, compareFilter?.valueForKey("inputSunRadius") as? NSNumber)
		XCTAssertEqual(dataStructure.striationStrength, compareFilter?.valueForKey("inputStriationStrength") as? NSNumber)
		XCTAssertEqual(dataStructure.center, compareFilter?.valueForKey("inputCenter") as? CIVector)
		XCTAssertEqual(dataStructure.maxStriationRadius, compareFilter?.valueForKey("inputMaxStriationRadius") as? NSNumber)
		XCTAssertEqual(dataStructure.time, compareFilter?.valueForKey("inputTime") as? NSNumber)
		XCTAssertEqual(dataStructure.color, compareFilter?.valueForKey("inputColor") as? CIColor)
		XCTAssertEqual(dataStructure.striationContrast, compareFilter?.valueForKey("inputStriationContrast") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputSunRadius") as? NSNumber, compareFilter?.valueForKey("inputSunRadius") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputStriationStrength") as? NSNumber, compareFilter?.valueForKey("inputStriationStrength") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputCenter") as? CIVector, compareFilter?.valueForKey("inputCenter") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputMaxStriationRadius") as? NSNumber, compareFilter?.valueForKey("inputMaxStriationRadius") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputTime") as? NSNumber, compareFilter?.valueForKey("inputTime") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputColor") as? CIColor, compareFilter?.valueForKey("inputColor") as? CIColor)
		XCTAssertEqual(generatedFilter?.valueForKey("inputStriationContrast") as? NSNumber, compareFilter?.valueForKey("inputStriationContrast") as? NSNumber)
	}

}