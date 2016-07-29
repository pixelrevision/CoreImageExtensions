import XCTest

class VignetteEffectTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = VignetteEffect(intensity: 1, image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, center: CIVector(values: [150.0, 150.0], count: 2), radius: 150, falloff: 0.5)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIVignetteEffect")
		XCTAssertEqual(dataStructure.intensity, compareFilter?.valueForKey("inputIntensity") as? NSNumber)
		XCTAssertEqual(dataStructure.center, compareFilter?.valueForKey("inputCenter") as? CIVector)
		XCTAssertEqual(dataStructure.radius, compareFilter?.valueForKey("inputRadius") as? NSNumber)
		XCTAssertEqual(dataStructure.falloff, compareFilter?.valueForKey("inputFalloff") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputIntensity") as? NSNumber, compareFilter?.valueForKey("inputIntensity") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputCenter") as? CIVector, compareFilter?.valueForKey("inputCenter") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputRadius") as? NSNumber, compareFilter?.valueForKey("inputRadius") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputFalloff") as? NSNumber, compareFilter?.valueForKey("inputFalloff") as? NSNumber)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.vignetteEffectFilter(1, center: CIVector(values: [150.0, 150.0], count: 2), radius: 150, falloff: 0.5)
		XCTAssertNotNil(newImage)
	}

}