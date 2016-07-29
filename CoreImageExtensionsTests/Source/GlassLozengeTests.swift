import XCTest

class GlassLozengeTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = GlassLozenge(point1: CIVector(values: [350.0, 150.0], count: 2), image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, refraction: 1.7, radius: 100, point0: CIVector(values: [150.0, 150.0], count: 2))
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIGlassLozenge")
		XCTAssertEqual(dataStructure.point1, compareFilter?.valueForKey("inputPoint1") as? CIVector)
		XCTAssertEqual(dataStructure.refraction, compareFilter?.valueForKey("inputRefraction") as? NSNumber)
		XCTAssertEqual(dataStructure.radius, compareFilter?.valueForKey("inputRadius") as? NSNumber)
		XCTAssertEqual(dataStructure.point0, compareFilter?.valueForKey("inputPoint0") as? CIVector)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputPoint1") as? CIVector, compareFilter?.valueForKey("inputPoint1") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputRefraction") as? NSNumber, compareFilter?.valueForKey("inputRefraction") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputRadius") as? NSNumber, compareFilter?.valueForKey("inputRadius") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputPoint0") as? CIVector, compareFilter?.valueForKey("inputPoint0") as? CIVector)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.glassLozengeFilter(CIVector(values: [350.0, 150.0], count: 2), refraction: 1.7, radius: 100, point0: CIVector(values: [150.0, 150.0], count: 2))
		XCTAssertNotNil(newImage)
	}

}