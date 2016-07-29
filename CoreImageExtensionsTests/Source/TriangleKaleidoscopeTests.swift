import XCTest

class TriangleKaleidoscopeTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = TriangleKaleidoscope(size: 700, image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, rotation: 5.924285296593801, decay: 0.85, point: CIVector(values: [150.0, 150.0], count: 2))
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CITriangleKaleidoscope")
		XCTAssertEqual(dataStructure.size, compareFilter?.valueForKey("inputSize") as? NSNumber)
		XCTAssertEqual(dataStructure.rotation, compareFilter?.valueForKey("inputRotation") as? NSNumber)
		XCTAssertEqual(dataStructure.decay, compareFilter?.valueForKey("inputDecay") as? NSNumber)
		XCTAssertEqual(dataStructure.point, compareFilter?.valueForKey("inputPoint") as? CIVector)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputSize") as? NSNumber, compareFilter?.valueForKey("inputSize") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputRotation") as? NSNumber, compareFilter?.valueForKey("inputRotation") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputDecay") as? NSNumber, compareFilter?.valueForKey("inputDecay") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputPoint") as? CIVector, compareFilter?.valueForKey("inputPoint") as? CIVector)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.triangleKaleidoscopeFilter(700, rotation: 5.924285296593801, decay: 0.85, point: CIVector(values: [150.0, 150.0], count: 2))
		XCTAssertNotNil(newImage)
	}

}