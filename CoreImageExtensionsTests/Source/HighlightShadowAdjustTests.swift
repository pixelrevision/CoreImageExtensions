import XCTest

class HighlightShadowAdjustTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = HighlightShadowAdjust(image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, highlightAmount: 1, shadowAmount: 0, radius: 0)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIHighlightShadowAdjust")
		XCTAssertEqual(dataStructure.highlightAmount, compareFilter?.valueForKey("inputHighlightAmount") as? NSNumber)
		XCTAssertEqual(dataStructure.shadowAmount, compareFilter?.valueForKey("inputShadowAmount") as? NSNumber)
		XCTAssertEqual(dataStructure.radius, compareFilter?.valueForKey("inputRadius") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputHighlightAmount") as? NSNumber, compareFilter?.valueForKey("inputHighlightAmount") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputShadowAmount") as? NSNumber, compareFilter?.valueForKey("inputShadowAmount") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputRadius") as? NSNumber, compareFilter?.valueForKey("inputRadius") as? NSNumber)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.highlightShadowAdjustFilter(1, shadowAmount: 0, radius: 0)
		XCTAssertNotNil(newImage)
	}

}