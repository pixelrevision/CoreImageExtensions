import XCTest

class PhotoEffectMonoTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = PhotoEffectMono(image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIPhotoEffectMono")


		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.photoEffectMonoFilter()
		XCTAssertNotNil(newImage)
	}

}