import XCTest

class SourceOutCompositingTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = SourceOutCompositing(image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, backgroundImage: CIImage(name: "sample_image_2", classForBundle: self.dynamicType)!)
		XCTAssertNotNil(dataStructure.filter())
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.sourceOutCompositingFilter(CIImage(name: "sample_image_2", classForBundle: self.dynamicType)!)
		XCTAssertNotNil(newImage)
	}

}