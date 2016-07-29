import XCTest

class FalseColorTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = FalseColor(image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, color0: CIColor(red: 0.3, green: 0.0, blue: 0.0, alpha: 1.0), color1: CIColor(red: 1.0, green: 0.9, blue: 0.8, alpha: 1.0))
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIFalseColor")
		XCTAssertEqual(dataStructure.color0, compareFilter?.valueForKey("inputColor0") as? CIColor)
		XCTAssertEqual(dataStructure.color1, compareFilter?.valueForKey("inputColor1") as? CIColor)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputColor0") as? CIColor, compareFilter?.valueForKey("inputColor0") as? CIColor)
		XCTAssertEqual(generatedFilter?.valueForKey("inputColor1") as? CIColor, compareFilter?.valueForKey("inputColor1") as? CIColor)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.falseColorFilter(CIColor(red: 0.3, green: 0.0, blue: 0.0, alpha: 1.0), color1: CIColor(red: 1.0, green: 0.9, blue: 0.8, alpha: 1.0))
		XCTAssertNotNil(newImage)
	}

}