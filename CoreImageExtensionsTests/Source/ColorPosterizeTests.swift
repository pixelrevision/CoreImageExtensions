import XCTest

class ColorPosterizeTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = ColorPosterize(image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, levels: 6)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIColorPosterize")
		XCTAssertEqual(dataStructure.levels, compareFilter?.valueForKey("inputLevels") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputLevels") as? NSNumber, compareFilter?.valueForKey("inputLevels") as? NSNumber)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.colorPosterizeFilter(6)
		XCTAssertNotNil(newImage)
	}

}