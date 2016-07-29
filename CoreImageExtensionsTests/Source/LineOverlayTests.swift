import XCTest

class LineOverlayTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = LineOverlay(nRNoiseLevel: 0.07000000000000001, contrast: 50, threshold: 0.1, nRSharpness: 0.71, image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, edgeIntensity: 1)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CILineOverlay")
		XCTAssertEqual(dataStructure.nRNoiseLevel, compareFilter?.valueForKey("inputNRNoiseLevel") as? NSNumber)
		XCTAssertEqual(dataStructure.contrast, compareFilter?.valueForKey("inputContrast") as? NSNumber)
		XCTAssertEqual(dataStructure.threshold, compareFilter?.valueForKey("inputThreshold") as? NSNumber)
		XCTAssertEqual(dataStructure.nRSharpness, compareFilter?.valueForKey("inputNRSharpness") as? NSNumber)
		XCTAssertEqual(dataStructure.edgeIntensity, compareFilter?.valueForKey("inputEdgeIntensity") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputNRNoiseLevel") as? NSNumber, compareFilter?.valueForKey("inputNRNoiseLevel") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputContrast") as? NSNumber, compareFilter?.valueForKey("inputContrast") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputThreshold") as? NSNumber, compareFilter?.valueForKey("inputThreshold") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputNRSharpness") as? NSNumber, compareFilter?.valueForKey("inputNRSharpness") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputEdgeIntensity") as? NSNumber, compareFilter?.valueForKey("inputEdgeIntensity") as? NSNumber)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.lineOverlayFilter(0.07000000000000001, contrast: 50, threshold: 0.1, nRSharpness: 0.71, edgeIntensity: 1)
		XCTAssertNotNil(newImage)
	}

}