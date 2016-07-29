import XCTest

class DepthOfFieldTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = DepthOfField(point0: CIVector(values: [0.0, 300.0], count: 2), radius: 6, point1: CIVector(values: [300.0, 300.0], count: 2), image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, saturation: 1.5, unsharpMaskRadius: 2.5, unsharpMaskIntensity: 0.5)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIDepthOfField")
		XCTAssertEqual(dataStructure.point0, compareFilter?.valueForKey("inputPoint0") as? CIVector)
		XCTAssertEqual(dataStructure.radius, compareFilter?.valueForKey("inputRadius") as? NSNumber)
		XCTAssertEqual(dataStructure.point1, compareFilter?.valueForKey("inputPoint1") as? CIVector)
		XCTAssertEqual(dataStructure.saturation, compareFilter?.valueForKey("inputSaturation") as? NSNumber)
		XCTAssertEqual(dataStructure.unsharpMaskRadius, compareFilter?.valueForKey("inputUnsharpMaskRadius") as? NSNumber)
		XCTAssertEqual(dataStructure.unsharpMaskIntensity, compareFilter?.valueForKey("inputUnsharpMaskIntensity") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputPoint0") as? CIVector, compareFilter?.valueForKey("inputPoint0") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputRadius") as? NSNumber, compareFilter?.valueForKey("inputRadius") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputPoint1") as? CIVector, compareFilter?.valueForKey("inputPoint1") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputSaturation") as? NSNumber, compareFilter?.valueForKey("inputSaturation") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputUnsharpMaskRadius") as? NSNumber, compareFilter?.valueForKey("inputUnsharpMaskRadius") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputUnsharpMaskIntensity") as? NSNumber, compareFilter?.valueForKey("inputUnsharpMaskIntensity") as? NSNumber)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.depthOfFieldFilter(CIVector(values: [0.0, 300.0], count: 2), radius: 6, point1: CIVector(values: [300.0, 300.0], count: 2), saturation: 1.5, unsharpMaskRadius: 2.5, unsharpMaskIntensity: 0.5)
		XCTAssertNotNil(newImage)
	}

}