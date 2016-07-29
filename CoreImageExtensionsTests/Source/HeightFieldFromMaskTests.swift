import XCTest

class HeightFieldFromMaskTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = HeightFieldFromMask(image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, radius: 10)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIHeightFieldFromMask")
		XCTAssertEqual(dataStructure.radius, compareFilter?.valueForKey("inputRadius") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputRadius") as? NSNumber, compareFilter?.valueForKey("inputRadius") as? NSNumber)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.heightFieldFromMaskFilter(10)
		XCTAssertNotNil(newImage)
	}

}