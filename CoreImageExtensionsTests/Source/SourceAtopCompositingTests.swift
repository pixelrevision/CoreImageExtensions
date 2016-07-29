import XCTest

class SourceAtopCompositingTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = SourceAtopCompositing(image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, backgroundImage: CIImage(name: "sample_image_2", classForBundle: self.dynamicType)!)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CISourceAtopCompositing")
		compareFilter?.setValue(CIImage(name: "sample_image_2", classForBundle: self.dynamicType)!, forKey: kCIInputBackgroundImageKey)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.sourceAtopCompositingFilter(CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!)
		XCTAssertNotNil(newImage)
	}

}