import XCTest

class DisintegrateWithMaskTransitionTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = DisintegrateWithMaskTransition(shadowOffset: CIVector(values: [0.0, -10.0], count: 2), targetImage: CIImage(name: "sample_image_2", classForBundle: self.dynamicType)!, shadowDensity: 0.65, time: 0, maskImage: CIImage(name: "sample_image_2", classForBundle: self.dynamicType)!, image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, shadowRadius: 8)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIDisintegrateWithMaskTransition")
		compareFilter?.setValue(CIImage(name: "sample_image_2", classForBundle: self.dynamicType)!, forKey: kCIInputTargetImageKey)
		compareFilter?.setValue(CIImage(name: "sample_image_2", classForBundle: self.dynamicType)!, forKey: kCIInputMaskImageKey)
		XCTAssertEqual(dataStructure.shadowOffset, compareFilter?.valueForKey("inputShadowOffset") as? CIVector)
		XCTAssertEqual(dataStructure.shadowDensity, compareFilter?.valueForKey("inputShadowDensity") as? NSNumber)
		XCTAssertEqual(dataStructure.time, compareFilter?.valueForKey("inputTime") as? NSNumber)
		XCTAssertEqual(dataStructure.shadowRadius, compareFilter?.valueForKey("inputShadowRadius") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputShadowOffset") as? CIVector, compareFilter?.valueForKey("inputShadowOffset") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputShadowDensity") as? NSNumber, compareFilter?.valueForKey("inputShadowDensity") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputTime") as? NSNumber, compareFilter?.valueForKey("inputTime") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputShadowRadius") as? NSNumber, compareFilter?.valueForKey("inputShadowRadius") as? NSNumber)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.disintegrateWithMaskTransitionFilter(CIVector(values: [0.0, -10.0], count: 2), targetImage: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, shadowDensity: 0.65, time: 0, maskImage: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, shadowRadius: 8)
		XCTAssertNotNil(newImage)
	}

}