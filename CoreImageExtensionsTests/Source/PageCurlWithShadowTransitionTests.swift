import XCTest

class PageCurlWithShadowTransitionTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = PageCurlWithShadowTransition(targetImage: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, angle: 0, shadowSize: 0.5, shadowExtent: CIVector(values: [0.0, 0.0, 0.0, 0.0], count: 4), time: 0, extent: CIVector(values: [0.0, 0.0, 0.0, 0.0], count: 4), backsideImage: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, radius: 100, shadowAmount: 0.7, image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIPageCurlWithShadowTransition")
		XCTAssertEqual(dataStructure.angle, compareFilter?.valueForKey("inputAngle") as? NSNumber)
		XCTAssertEqual(dataStructure.shadowSize, compareFilter?.valueForKey("inputShadowSize") as? NSNumber)
		XCTAssertEqual(dataStructure.shadowExtent, compareFilter?.valueForKey("inputShadowExtent") as? CIVector)
		XCTAssertEqual(dataStructure.time, compareFilter?.valueForKey("inputTime") as? NSNumber)
		XCTAssertEqual(dataStructure.extent, compareFilter?.valueForKey("inputExtent") as? CIVector)
		XCTAssertEqual(dataStructure.radius, compareFilter?.valueForKey("inputRadius") as? NSNumber)
		XCTAssertEqual(dataStructure.shadowAmount, compareFilter?.valueForKey("inputShadowAmount") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputAngle") as? NSNumber, compareFilter?.valueForKey("inputAngle") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputShadowSize") as? NSNumber, compareFilter?.valueForKey("inputShadowSize") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputShadowExtent") as? CIVector, compareFilter?.valueForKey("inputShadowExtent") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputTime") as? NSNumber, compareFilter?.valueForKey("inputTime") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputExtent") as? CIVector, compareFilter?.valueForKey("inputExtent") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputRadius") as? NSNumber, compareFilter?.valueForKey("inputRadius") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputShadowAmount") as? NSNumber, compareFilter?.valueForKey("inputShadowAmount") as? NSNumber)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.pageCurlWithShadowTransitionFilter(CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, angle: 0, shadowSize: 0.5, shadowExtent: CIVector(values: [0.0, 0.0, 0.0, 0.0], count: 4), time: 0, extent: CIVector(values: [0.0, 0.0, 0.0, 0.0], count: 4), backsideImage: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, radius: 100, shadowAmount: 0.7)
		XCTAssertNotNil(newImage)
	}

}