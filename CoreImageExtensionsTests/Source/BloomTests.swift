import XCTest

class BloomTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = Bloom(intensity: 0.5, image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, radius: 10)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIBloom")
		XCTAssertEqual(dataStructure.intensity, compareFilter?.valueForKey("inputIntensity") as? NSNumber)
		// base filter states that default is 10 but filter is starting with nil
		XCTAssertNotEqual(dataStructure.radius, compareFilter?.valueForKey("inputRadius") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputIntensity") as? NSNumber, compareFilter?.valueForKey("inputIntensity") as? NSNumber)
		// base filter states that default is 10 but filter is starting with nil
		XCTAssertNotEqual(generatedFilter?.valueForKey("inputRadius") as? NSNumber, compareFilter?.valueForKey("inputRadius") as? NSNumber)
		
		// add in radius for comparison
		compareFilter?.setValue(10, forKey: kCIInputRadiusKey)
		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.bloomFilter(1, radius: 10)
		XCTAssertNotNil(newImage)
	}

}