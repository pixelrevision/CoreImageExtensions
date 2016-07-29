import XCTest

class AreaMaximumAlphaTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = AreaMaximumAlpha(image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, extent: CIVector(values: [0.0, 0.0, 640.0, 80.0], count: 4))
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIAreaMaximumAlpha")
		XCTAssertEqual(dataStructure.extent, compareFilter?.valueForKey("inputExtent") as? CIVector)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputExtent") as? CIVector, compareFilter?.valueForKey("inputExtent") as? CIVector)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.areaMaximumAlphaFilter(CIVector(values: [0.0, 0.0, 640.0, 80.0], count: 4))
		XCTAssertNotNil(newImage)
	}

}