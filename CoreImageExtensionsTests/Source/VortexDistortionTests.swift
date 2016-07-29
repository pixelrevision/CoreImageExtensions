import XCTest

class VortexDistortionTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = VortexDistortion(image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, center: CIVector(values: [150.0, 150.0], count: 2), angle: 56.54866776461628, radius: 300)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIVortexDistortion")
		XCTAssertEqual(dataStructure.center, compareFilter?.valueForKey("inputCenter") as? CIVector)
		XCTAssertEqual(dataStructure.angle.floatValue, (compareFilter?.valueForKey("inputAngle") as? NSNumber)?.floatValue)
		XCTAssertEqual(dataStructure.radius, compareFilter?.valueForKey("inputRadius") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputCenter") as? CIVector, compareFilter?.valueForKey("inputCenter") as? CIVector)
		XCTAssertEqual((generatedFilter?.valueForKey("inputAngle") as? NSNumber)?.floatValue, (compareFilter?.valueForKey("inputAngle") as? NSNumber)?.floatValue)
		XCTAssertEqual(generatedFilter?.valueForKey("inputRadius") as? NSNumber, compareFilter?.valueForKey("inputRadius") as? NSNumber)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.vortexDistortionFilter(CIVector(values: [150.0, 150.0], count: 2), angle: 56.54866776461628, radius: 300)
		XCTAssertNotNil(newImage)
	}

}