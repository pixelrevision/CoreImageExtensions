import XCTest

class PhotoEffectInstantTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = PhotoEffectInstant(image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIPhotoEffectInstant")


		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.photoEffectInstantFilter()
		XCTAssertNotNil(newImage)
	}

}