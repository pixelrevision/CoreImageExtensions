import XCTest

class PerspectiveTransformTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = PerspectiveTransform(topRight: CIVector(values: [646.0, 507.0], count: 2), image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, bottomLeft: CIVector(values: [155.0, 153.0], count: 2), topLeft: CIVector(values: [118.0, 484.0], count: 2), bottomRight: CIVector(values: [548.0, 140.0], count: 2))
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIPerspectiveTransform")
		XCTAssertEqual(dataStructure.topRight, compareFilter?.valueForKey("inputTopRight") as? CIVector)
		XCTAssertEqual(dataStructure.bottomLeft, compareFilter?.valueForKey("inputBottomLeft") as? CIVector)
		XCTAssertEqual(dataStructure.topLeft, compareFilter?.valueForKey("inputTopLeft") as? CIVector)
		XCTAssertEqual(dataStructure.bottomRight, compareFilter?.valueForKey("inputBottomRight") as? CIVector)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputTopRight") as? CIVector, compareFilter?.valueForKey("inputTopRight") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputBottomLeft") as? CIVector, compareFilter?.valueForKey("inputBottomLeft") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputTopLeft") as? CIVector, compareFilter?.valueForKey("inputTopLeft") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputBottomRight") as? CIVector, compareFilter?.valueForKey("inputBottomRight") as? CIVector)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.perspectiveTransformFilter(CIVector(values: [646.0, 507.0], count: 2), bottomLeft: CIVector(values: [155.0, 153.0], count: 2), topLeft: CIVector(values: [118.0, 484.0], count: 2), bottomRight: CIVector(values: [548.0, 140.0], count: 2))
		XCTAssertNotNil(newImage)
	}

}