import XCTest

class ColorControlsTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = ColorControls(image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, contrast: 1, saturation: 1, brightness: 0)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIColorControls")
		XCTAssertEqual(dataStructure.contrast, compareFilter?.valueForKey("inputContrast") as? NSNumber)
		XCTAssertEqual(dataStructure.saturation, compareFilter?.valueForKey("inputSaturation") as? NSNumber)
		XCTAssertEqual(dataStructure.brightness, compareFilter?.valueForKey("inputBrightness") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputContrast") as? NSNumber, compareFilter?.valueForKey("inputContrast") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputSaturation") as? NSNumber, compareFilter?.valueForKey("inputSaturation") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputBrightness") as? NSNumber, compareFilter?.valueForKey("inputBrightness") as? NSNumber)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.colorControlsFilter(1, saturation: 1, brightness: 0)
		XCTAssertNotNil(newImage)
	}

}