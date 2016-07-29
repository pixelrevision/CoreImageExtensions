import XCTest

class ZoomBlurTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = ZoomBlur(image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, amount: 20, center: CIVector(values: [150.0, 150.0], count: 2))
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIZoomBlur")
		XCTAssertEqual(dataStructure.amount, compareFilter?.valueForKey("inputAmount") as? NSNumber)
		XCTAssertEqual(dataStructure.center, compareFilter?.valueForKey("inputCenter") as? CIVector)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputAmount") as? NSNumber, compareFilter?.valueForKey("inputAmount") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputCenter") as? CIVector, compareFilter?.valueForKey("inputCenter") as? CIVector)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.zoomBlurFilter(20, center: CIVector(values: [150.0, 150.0], count: 2))
		XCTAssertNotNil(newImage)
	}

}