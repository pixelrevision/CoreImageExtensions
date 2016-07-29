import XCTest

class PhotoEffectNoirTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = PhotoEffectNoir(image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIPhotoEffectNoir")


		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.photoEffectNoirFilter()
		XCTAssertNotNil(newImage)
	}

}