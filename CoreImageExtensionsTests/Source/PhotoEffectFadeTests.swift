import XCTest

class PhotoEffectFadeTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = PhotoEffectFade(image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIPhotoEffectFade")


		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.photoEffectFadeFilter()
		XCTAssertNotNil(newImage)
	}

}