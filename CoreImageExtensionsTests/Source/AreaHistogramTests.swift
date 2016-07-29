import XCTest

class AreaHistogramTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = AreaHistogram(count: 64, image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, scale: 1, extent: CIVector(values: [0.0, 0.0, 640.0, 80.0], count: 4))
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIAreaHistogram")
		XCTAssertEqual(dataStructure.count, compareFilter?.valueForKey("inputCount") as? NSNumber)
		XCTAssertEqual(dataStructure.scale, compareFilter?.valueForKey("inputScale") as? NSNumber)
		XCTAssertEqual(dataStructure.extent, compareFilter?.valueForKey("inputExtent") as? CIVector)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputCount") as? NSNumber, compareFilter?.valueForKey("inputCount") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputScale") as? NSNumber, compareFilter?.valueForKey("inputScale") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputExtent") as? CIVector, compareFilter?.valueForKey("inputExtent") as? CIVector)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.areaHistogramFilter(64, scale: 1, extent: CIVector(values: [0.0, 0.0, 640.0, 80.0], count: 4))
		XCTAssertNotNil(newImage)
	}

}