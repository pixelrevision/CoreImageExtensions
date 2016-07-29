import XCTest

class HoleDistortionTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = HoleDistortion(image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, center: CIVector(values: [150.0, 150.0], count: 2), radius: 150)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIHoleDistortion")
		XCTAssertEqual(dataStructure.center, compareFilter?.valueForKey("inputCenter") as? CIVector)
		XCTAssertEqual(dataStructure.radius, compareFilter?.valueForKey("inputRadius") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputCenter") as? CIVector, compareFilter?.valueForKey("inputCenter") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputRadius") as? NSNumber, compareFilter?.valueForKey("inputRadius") as? NSNumber)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.holeDistortionFilter(CIVector(values: [150.0, 150.0], count: 2), radius: 150)
		XCTAssertNotNil(newImage)
	}

}