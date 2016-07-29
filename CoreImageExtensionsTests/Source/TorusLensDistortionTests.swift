import XCTest

class TorusLensDistortionTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = TorusLensDistortion(width: 80, image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, center: CIVector(values: [150.0, 150.0], count: 2), refraction: 1.7, radius: 160)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CITorusLensDistortion")
		XCTAssertEqual(dataStructure.width, compareFilter?.valueForKey("inputWidth") as? NSNumber)
		XCTAssertEqual(dataStructure.center, compareFilter?.valueForKey("inputCenter") as? CIVector)
		XCTAssertEqual(dataStructure.refraction, compareFilter?.valueForKey("inputRefraction") as? NSNumber)
		XCTAssertEqual(dataStructure.radius, compareFilter?.valueForKey("inputRadius") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputWidth") as? NSNumber, compareFilter?.valueForKey("inputWidth") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputCenter") as? CIVector, compareFilter?.valueForKey("inputCenter") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputRefraction") as? NSNumber, compareFilter?.valueForKey("inputRefraction") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputRadius") as? NSNumber, compareFilter?.valueForKey("inputRadius") as? NSNumber)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.torusLensDistortionFilter(80, center: CIVector(values: [150.0, 150.0], count: 2), refraction: 1.7, radius: 160)
		XCTAssertNotNil(newImage)
	}

}