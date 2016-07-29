import XCTest

class CMYKHalftoneTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = CMYKHalftone(width: 6, center: CIVector(values: [150.0, 150.0], count: 2), angle: 0, uCR: 0.5, sharpness: 0.7, gCR: 1, image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CICMYKHalftone")
		XCTAssertEqual(dataStructure.width, compareFilter?.valueForKey("inputWidth") as? NSNumber)
		XCTAssertEqual(dataStructure.center, compareFilter?.valueForKey("inputCenter") as? CIVector)
		XCTAssertEqual(dataStructure.angle, compareFilter?.valueForKey("inputAngle") as? NSNumber)
		XCTAssertEqual(dataStructure.uCR, compareFilter?.valueForKey("inputUCR") as? NSNumber)
		XCTAssertEqual(dataStructure.sharpness, compareFilter?.valueForKey("inputSharpness") as? NSNumber)
		XCTAssertEqual(dataStructure.gCR, compareFilter?.valueForKey("inputGCR") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputWidth") as? NSNumber, compareFilter?.valueForKey("inputWidth") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputCenter") as? CIVector, compareFilter?.valueForKey("inputCenter") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputAngle") as? NSNumber, compareFilter?.valueForKey("inputAngle") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputUCR") as? NSNumber, compareFilter?.valueForKey("inputUCR") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputSharpness") as? NSNumber, compareFilter?.valueForKey("inputSharpness") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputGCR") as? NSNumber, compareFilter?.valueForKey("inputGCR") as? NSNumber)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.cMYKHalftoneFilter(6, center: CIVector(values: [150.0, 150.0], count: 2), angle: 0, uCR: 0.5, sharpness: 0.7, gCR: 1)
		XCTAssertNotNil(newImage)
	}

}