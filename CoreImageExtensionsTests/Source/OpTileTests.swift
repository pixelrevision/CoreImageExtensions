import XCTest

class OpTileTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = OpTile(width: 65, image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, center: CIVector(values: [150.0, 150.0], count: 2), angle: 0, scale: 2.8)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIOpTile")
		XCTAssertEqual(dataStructure.width, compareFilter?.valueForKey("inputWidth") as? NSNumber)
		XCTAssertEqual(dataStructure.center, compareFilter?.valueForKey("inputCenter") as? CIVector)
		XCTAssertEqual(dataStructure.angle, compareFilter?.valueForKey("inputAngle") as? NSNumber)
		XCTAssertEqual(dataStructure.scale, compareFilter?.valueForKey("inputScale") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputWidth") as? NSNumber, compareFilter?.valueForKey("inputWidth") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputCenter") as? CIVector, compareFilter?.valueForKey("inputCenter") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputAngle") as? NSNumber, compareFilter?.valueForKey("inputAngle") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputScale") as? NSNumber, compareFilter?.valueForKey("inputScale") as? NSNumber)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.opTileFilter(65, center: CIVector(values: [150.0, 150.0], count: 2), angle: 0, scale: 2.8)
		XCTAssertNotNil(newImage)
	}

}