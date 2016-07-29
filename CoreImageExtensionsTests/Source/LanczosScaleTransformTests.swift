import XCTest

class LanczosScaleTransformTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = LanczosScaleTransform(image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, aspectRatio: 1, scale: 1)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CILanczosScaleTransform")
		XCTAssertEqual(dataStructure.aspectRatio, compareFilter?.valueForKey("inputAspectRatio") as? NSNumber)
		XCTAssertEqual(dataStructure.scale, compareFilter?.valueForKey("inputScale") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputAspectRatio") as? NSNumber, compareFilter?.valueForKey("inputAspectRatio") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputScale") as? NSNumber, compareFilter?.valueForKey("inputScale") as? NSNumber)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.lanczosScaleTransformFilter(1, scale: 1)
		XCTAssertNotNil(newImage)
	}

}