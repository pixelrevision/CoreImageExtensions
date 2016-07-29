import XCTest

class HexagonalPixellateTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = HexagonalPixellate(image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, center: CIVector(values: [150.0, 150.0], count: 2), scale: 8)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIHexagonalPixellate")
		XCTAssertEqual(dataStructure.center, compareFilter?.valueForKey("inputCenter") as? CIVector)
		XCTAssertEqual(dataStructure.scale, compareFilter?.valueForKey("inputScale") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputCenter") as? CIVector, compareFilter?.valueForKey("inputCenter") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputScale") as? NSNumber, compareFilter?.valueForKey("inputScale") as? NSNumber)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.hexagonalPixellateFilter(CIVector(values: [150.0, 150.0], count: 2), scale: 8)
		XCTAssertNotNil(newImage)
	}

}