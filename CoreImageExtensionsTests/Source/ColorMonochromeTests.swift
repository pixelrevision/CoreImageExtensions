import XCTest

class ColorMonochromeTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = ColorMonochrome(intensity: 1, image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, color: CIColor(red: 0.6, green: 0.45, blue: 0.3, alpha: 1.0))
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIColorMonochrome")
		XCTAssertEqual(dataStructure.intensity, compareFilter?.valueForKey("inputIntensity") as? NSNumber)
		XCTAssertEqual(dataStructure.color, compareFilter?.valueForKey("inputColor") as? CIColor)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputIntensity") as? NSNumber, compareFilter?.valueForKey("inputIntensity") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputColor") as? CIColor, compareFilter?.valueForKey("inputColor") as? CIColor)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.colorMonochromeFilter(1, color: CIColor(red: 0.6, green: 0.45, blue: 0.3, alpha: 1.0))
		XCTAssertNotNil(newImage)
	}

}