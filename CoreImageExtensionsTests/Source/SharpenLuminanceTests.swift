import XCTest

class SharpenLuminanceTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = SharpenLuminance(image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, sharpness: 0.4)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CISharpenLuminance")
		XCTAssertEqual(dataStructure.sharpness, compareFilter?.valueForKey("inputSharpness") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputSharpness") as? NSNumber, compareFilter?.valueForKey("inputSharpness") as? NSNumber)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.sharpenLuminanceFilter(0.4)
		XCTAssertNotNil(newImage)
	}

}