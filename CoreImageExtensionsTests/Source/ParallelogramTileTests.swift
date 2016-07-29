import XCTest

class ParallelogramTileTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = ParallelogramTile(width: 100, image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, acuteAngle: 1.570796326794897, center: CIVector(values: [150.0, 150.0], count: 2), angle: 0)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIParallelogramTile")
		XCTAssertEqual(dataStructure.width, compareFilter?.valueForKey("inputWidth") as? NSNumber)
		XCTAssertEqual(dataStructure.acuteAngle.floatValue, (compareFilter?.valueForKey("inputAcuteAngle") as? NSNumber)?.floatValue)
		XCTAssertEqual(dataStructure.center, compareFilter?.valueForKey("inputCenter") as? CIVector)
		XCTAssertEqual(dataStructure.angle, compareFilter?.valueForKey("inputAngle") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputWidth") as? NSNumber, compareFilter?.valueForKey("inputWidth") as? NSNumber)
		XCTAssertEqual((generatedFilter?.valueForKey("inputAcuteAngle") as? NSNumber)?.floatValue, (compareFilter?.valueForKey("inputAcuteAngle") as? NSNumber)?.floatValue)
		XCTAssertEqual(generatedFilter?.valueForKey("inputCenter") as? CIVector, compareFilter?.valueForKey("inputCenter") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputAngle") as? NSNumber, compareFilter?.valueForKey("inputAngle") as? NSNumber)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.parallelogramTileFilter(100, acuteAngle: 1.570796326794897, center: CIVector(values: [150.0, 150.0], count: 2), angle: 0)
		XCTAssertNotNil(newImage)
	}

}