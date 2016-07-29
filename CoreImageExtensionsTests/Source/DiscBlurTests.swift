import XCTest

class DiscBlurTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = DiscBlur(image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, radius: 8)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIDiscBlur")
		XCTAssertEqual(dataStructure.radius, compareFilter?.valueForKey("inputRadius") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputRadius") as? NSNumber, compareFilter?.valueForKey("inputRadius") as? NSNumber)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.discBlurFilter(8)
		XCTAssertNotNil(newImage)
	}

}