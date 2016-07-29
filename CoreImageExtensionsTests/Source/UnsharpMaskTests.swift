import XCTest

class UnsharpMaskTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = UnsharpMask(intensity: 0.5, image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, radius: 2.5)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIUnsharpMask")
		XCTAssertEqual(dataStructure.intensity, compareFilter?.valueForKey("inputIntensity") as? NSNumber)
		XCTAssertEqual(dataStructure.radius, compareFilter?.valueForKey("inputRadius") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputIntensity") as? NSNumber, compareFilter?.valueForKey("inputIntensity") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputRadius") as? NSNumber, compareFilter?.valueForKey("inputRadius") as? NSNumber)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.unsharpMaskFilter(0.5, radius: 2.5)
		XCTAssertNotNil(newImage)
	}

}