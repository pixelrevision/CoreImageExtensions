import XCTest

class ColorClampTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = ColorClamp(image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, minComponents: CIVector(values: [0.0, 0.0, 0.0, 0.0], count: 4), maxComponents: CIVector(values: [1.0, 1.0, 1.0, 1.0], count: 4))
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIColorClamp")
		XCTAssertEqual(dataStructure.minComponents, compareFilter?.valueForKey("inputMinComponents") as? CIVector)
		XCTAssertEqual(dataStructure.maxComponents, compareFilter?.valueForKey("inputMaxComponents") as? CIVector)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputMinComponents") as? CIVector, compareFilter?.valueForKey("inputMinComponents") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputMaxComponents") as? CIVector, compareFilter?.valueForKey("inputMaxComponents") as? CIVector)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.colorClampFilter(CIVector(values: [0.0, 0.0, 0.0, 0.0], count: 4), maxComponents: CIVector(values: [1.0, 1.0, 1.0, 1.0], count: 4))
		XCTAssertNotNil(newImage)
	}

}