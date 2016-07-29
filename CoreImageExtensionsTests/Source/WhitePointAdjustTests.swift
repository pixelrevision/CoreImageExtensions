import XCTest

class WhitePointAdjustTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = WhitePointAdjust(image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, color: CIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIWhitePointAdjust")
		XCTAssertEqual(dataStructure.color, compareFilter?.valueForKey("inputColor") as? CIColor)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputColor") as? CIColor, compareFilter?.valueForKey("inputColor") as? CIColor)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.whitePointAdjustFilter(CIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
		XCTAssertNotNil(newImage)
	}

}