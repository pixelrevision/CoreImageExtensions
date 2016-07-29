import XCTest

class PageCurlTransitionTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = PageCurlTransition(targetImage: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, angle: 0, radius: 100, time: 0, extent: CIVector(values: [0.0, 0.0, 300.0, 300.0], count: 4), backsideImage: CIImage(name: "sample_image_2", classForBundle: self.dynamicType)!, image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, shadingImage: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIPageCurlTransition")
		compareFilter?.setValue(CIImage(name: "sample_image_2", classForBundle: self.dynamicType)!, forKey: "inputBacksideImage")
		compareFilter?.setValue(CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, forKey: kCIInputShadingImageKey)
		
		XCTAssertEqual(dataStructure.angle, compareFilter?.valueForKey("inputAngle") as? NSNumber)
		XCTAssertEqual(dataStructure.radius, compareFilter?.valueForKey("inputRadius") as? NSNumber)
		XCTAssertEqual(dataStructure.time, compareFilter?.valueForKey("inputTime") as? NSNumber)
		XCTAssertEqual(dataStructure.extent, compareFilter?.valueForKey("inputExtent") as? CIVector)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputAngle") as? NSNumber, compareFilter?.valueForKey("inputAngle") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputRadius") as? NSNumber, compareFilter?.valueForKey("inputRadius") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputTime") as? NSNumber, compareFilter?.valueForKey("inputTime") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputExtent") as? CIVector, compareFilter?.valueForKey("inputExtent") as? CIVector)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.pageCurlTransitionFilter(CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, angle: 0, radius: 100, time: 0, extent: CIVector(values: [0.0, 0.0, 300.0, 300.0], count: 4), backsideImage: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, shadingImage: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!)
		XCTAssertNotNil(newImage)
	}

}