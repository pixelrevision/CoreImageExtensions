import XCTest

class LuminosityBlendModeTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = LuminosityBlendMode(image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, backgroundImage: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CILuminosityBlendMode")


		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.luminosityBlendModeFilter(CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!)
		XCTAssertNotNil(newImage)
	}

}