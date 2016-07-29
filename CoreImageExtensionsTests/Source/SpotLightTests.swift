import XCTest

class SpotLightTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = SpotLight(lightPosition: CIVector(values: [400.0, 600.0, 150.0], count: 3), image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, lightPointsAt: CIVector(values: [200.0, 200.0, 0.0], count: 3), concentration: 0.1, brightness: 3, color: CIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CISpotLight")
		XCTAssertEqual(dataStructure.lightPosition, compareFilter?.valueForKey("inputLightPosition") as? CIVector)
		XCTAssertEqual(dataStructure.lightPointsAt, compareFilter?.valueForKey("inputLightPointsAt") as? CIVector)
		XCTAssertEqual(dataStructure.concentration, compareFilter?.valueForKey("inputConcentration") as? NSNumber)
		XCTAssertEqual(dataStructure.brightness, compareFilter?.valueForKey("inputBrightness") as? NSNumber)
		XCTAssertEqual(dataStructure.color, compareFilter?.valueForKey("inputColor") as? CIColor)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputLightPosition") as? CIVector, compareFilter?.valueForKey("inputLightPosition") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputLightPointsAt") as? CIVector, compareFilter?.valueForKey("inputLightPointsAt") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputConcentration") as? NSNumber, compareFilter?.valueForKey("inputConcentration") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputBrightness") as? NSNumber, compareFilter?.valueForKey("inputBrightness") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputColor") as? CIColor, compareFilter?.valueForKey("inputColor") as? CIColor)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.spotLightFilter(CIVector(values: [400.0, 600.0, 150.0], count: 3), lightPointsAt: CIVector(values: [200.0, 200.0, 0.0], count: 3), concentration: 0.1, brightness: 3, color: CIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0))
		XCTAssertNotNil(newImage)
	}

}