import XCTest

class TemperatureAndTintTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = TemperatureAndTint(neutral: CIVector(values: [6500.0, 0.0], count: 2), image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, targetNeutral: CIVector(values: [6500.0, 0.0], count: 2))
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CITemperatureAndTint")
		XCTAssertEqual(dataStructure.neutral, compareFilter?.valueForKey("inputNeutral") as? CIVector)
		XCTAssertEqual(dataStructure.targetNeutral, compareFilter?.valueForKey("inputTargetNeutral") as? CIVector)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputNeutral") as? CIVector, compareFilter?.valueForKey("inputNeutral") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputTargetNeutral") as? CIVector, compareFilter?.valueForKey("inputTargetNeutral") as? CIVector)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.temperatureAndTintFilter(CIVector(values: [6500.0, 0.0], count: 2), targetNeutral: CIVector(values: [6500.0, 0.0], count: 2))
		XCTAssertNotNil(newImage)
	}

}