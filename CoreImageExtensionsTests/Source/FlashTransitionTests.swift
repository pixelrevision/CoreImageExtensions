import XCTest

class FlashTransitionTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = FlashTransition(targetImage: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, striationStrength: 0.5, center: CIVector(values: [150.0, 150.0], count: 2), maxStriationRadius: 2.58, time: 0, color: CIColor(red: 1.0, green: 0.8, blue: 0.6, alpha: 1.0), extent: CIVector(values: [0.0, 0.0, 300.0, 300.0], count: 4), striationContrast: 1.375, image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, fadeThreshold: 0.85)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIFlashTransition")
		XCTAssertEqual(dataStructure.striationStrength, compareFilter?.valueForKey("inputStriationStrength") as? NSNumber)
		XCTAssertEqual(dataStructure.center, compareFilter?.valueForKey("inputCenter") as? CIVector)
		XCTAssertEqual(dataStructure.maxStriationRadius, compareFilter?.valueForKey("inputMaxStriationRadius") as? NSNumber)
		XCTAssertEqual(dataStructure.time, compareFilter?.valueForKey("inputTime") as? NSNumber)
		XCTAssertEqual(dataStructure.color, compareFilter?.valueForKey("inputColor") as? CIColor)
		XCTAssertEqual(dataStructure.extent, compareFilter?.valueForKey("inputExtent") as? CIVector)
		XCTAssertEqual(dataStructure.striationContrast, compareFilter?.valueForKey("inputStriationContrast") as? NSNumber)
		XCTAssertEqual(dataStructure.fadeThreshold, compareFilter?.valueForKey("inputFadeThreshold") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputStriationStrength") as? NSNumber, compareFilter?.valueForKey("inputStriationStrength") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputCenter") as? CIVector, compareFilter?.valueForKey("inputCenter") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputMaxStriationRadius") as? NSNumber, compareFilter?.valueForKey("inputMaxStriationRadius") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputTime") as? NSNumber, compareFilter?.valueForKey("inputTime") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputColor") as? CIColor, compareFilter?.valueForKey("inputColor") as? CIColor)
		XCTAssertEqual(generatedFilter?.valueForKey("inputExtent") as? CIVector, compareFilter?.valueForKey("inputExtent") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputStriationContrast") as? NSNumber, compareFilter?.valueForKey("inputStriationContrast") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputFadeThreshold") as? NSNumber, compareFilter?.valueForKey("inputFadeThreshold") as? NSNumber)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.flashTransitionFilter(CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, striationStrength: 0.5, center: CIVector(values: [150.0, 150.0], count: 2), maxStriationRadius: 2.58, time: 0, color: CIColor(red: 1.0, green: 0.8, blue: 0.6, alpha: 1.0), extent: CIVector(values: [0.0, 0.0, 300.0, 300.0], count: 4), striationContrast: 1.375, fadeThreshold: 0.85)
		XCTAssertNotNil(newImage)
	}

}