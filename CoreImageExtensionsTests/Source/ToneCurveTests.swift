import XCTest

class ToneCurveTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = ToneCurve(point1: CIVector(values: [0.25, 0.25], count: 2), image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, point3: CIVector(values: [0.75, 0.75], count: 2), point2: CIVector(values: [0.5, 0.5], count: 2), point0: CIVector(values: [0.0, 0.0], count: 2), point4: CIVector(values: [1.0, 1.0], count: 2))
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIToneCurve")
		XCTAssertEqual(dataStructure.point1, compareFilter?.valueForKey("inputPoint1") as? CIVector)
		XCTAssertEqual(dataStructure.point3, compareFilter?.valueForKey("inputPoint3") as? CIVector)
		XCTAssertEqual(dataStructure.point2, compareFilter?.valueForKey("inputPoint2") as? CIVector)
		XCTAssertEqual(dataStructure.point0, compareFilter?.valueForKey("inputPoint0") as? CIVector)
		XCTAssertEqual(dataStructure.point4, compareFilter?.valueForKey("inputPoint4") as? CIVector)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputPoint1") as? CIVector, compareFilter?.valueForKey("inputPoint1") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputPoint3") as? CIVector, compareFilter?.valueForKey("inputPoint3") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputPoint2") as? CIVector, compareFilter?.valueForKey("inputPoint2") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputPoint0") as? CIVector, compareFilter?.valueForKey("inputPoint0") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputPoint4") as? CIVector, compareFilter?.valueForKey("inputPoint4") as? CIVector)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.toneCurveFilter(CIVector(values: [0.25, 0.25], count: 2), point3: CIVector(values: [0.75, 0.75], count: 2), point2: CIVector(values: [0.5, 0.5], count: 2), point0: CIVector(values: [0.0, 0.0], count: 2), point4: CIVector(values: [1.0, 1.0], count: 2))
		XCTAssertNotNil(newImage)
	}

}