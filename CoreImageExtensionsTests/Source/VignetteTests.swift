import XCTest

class VignetteTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = Vignette(intensity: 0, image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, radius: 1)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIVignette")
		XCTAssertEqual(dataStructure.intensity, compareFilter?.valueForKey("inputIntensity") as? NSNumber)
		XCTAssertEqual(dataStructure.radius, compareFilter?.valueForKey("inputRadius") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputIntensity") as? NSNumber, compareFilter?.valueForKey("inputIntensity") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputRadius") as? NSNumber, compareFilter?.valueForKey("inputRadius") as? NSNumber)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.vignetteFilter(0, radius: 1)
		XCTAssertNotNil(newImage)
	}

}