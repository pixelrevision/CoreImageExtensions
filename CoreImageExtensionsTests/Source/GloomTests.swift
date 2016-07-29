import XCTest

class GloomTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = Gloom(intensity: 0.5, image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, radius: 10)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIGloom")
		// core image leaves a nil value for radius make sure this is still the case
		XCTAssertNil(compareFilter?.valueForKey("inputRadius") as? NSNumber)
		compareFilter?.setValue(10, forKey: "inputRadius") // set the radius here as the value is not set by default in CoreImage
		XCTAssertEqual(dataStructure.intensity, compareFilter?.valueForKey("inputIntensity") as? NSNumber)
		XCTAssertEqual(dataStructure.radius, compareFilter?.valueForKey("inputRadius") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputIntensity") as? NSNumber, compareFilter?.valueForKey("inputIntensity") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputRadius") as? NSNumber, compareFilter?.valueForKey("inputRadius") as? NSNumber)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.gloomFilter(1, radius: 10)
		XCTAssertNotNil(newImage)
	}

}