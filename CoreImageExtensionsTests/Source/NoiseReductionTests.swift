import XCTest

class NoiseReductionTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = NoiseReduction(noiseLevel: 0.02, image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, sharpness: 0.4)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CINoiseReduction")
		XCTAssertEqual(dataStructure.noiseLevel, compareFilter?.valueForKey("inputNoiseLevel") as? NSNumber)
		XCTAssertEqual(dataStructure.sharpness, compareFilter?.valueForKey("inputSharpness") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputNoiseLevel") as? NSNumber, compareFilter?.valueForKey("inputNoiseLevel") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputSharpness") as? NSNumber, compareFilter?.valueForKey("inputSharpness") as? NSNumber)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.noiseReductionFilter(0.02, sharpness: 0.4)
		XCTAssertNotNil(newImage)
	}

}