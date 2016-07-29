import XCTest

class SpotColorTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = SpotColor(contrast1: 0.98, centerColor1: CIColor(red: 0.0784, green: 0.0627, blue: 0.0706, alpha: 1.0), contrast3: 0.99, centerColor3: CIColor(red: 0.9216, green: 0.4549, blue: 0.3333, alpha: 1.0), replacementColor3: CIColor(red: 0.9098, green: 0.7529, blue: 0.6078, alpha: 1.0), replacementColor1: CIColor(red: 0.4392, green: 0.1922, blue: 0.1961, alpha: 1.0), image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, closeness2: 0.15, centerColor2: CIColor(red: 0.5255, green: 0.3059, blue: 0.3451, alpha: 1.0), closeness1: 0.22, closeness3: 0.5, replacementColor2: CIColor(red: 0.9137, green: 0.5608, blue: 0.5059, alpha: 1.0), contrast2: 0.98)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CISpotColor")
		XCTAssertEqual(dataStructure.contrast1, compareFilter?.valueForKey("inputContrast1") as? NSNumber)
		XCTAssertEqual(dataStructure.centerColor1, compareFilter?.valueForKey("inputCenterColor1") as? CIColor)
		XCTAssertEqual(dataStructure.contrast3, compareFilter?.valueForKey("inputContrast3") as? NSNumber)
		XCTAssertEqual(dataStructure.centerColor3, compareFilter?.valueForKey("inputCenterColor3") as? CIColor)
		XCTAssertEqual(dataStructure.replacementColor3, compareFilter?.valueForKey("inputReplacementColor3") as? CIColor)
		XCTAssertEqual(dataStructure.replacementColor1, compareFilter?.valueForKey("inputReplacementColor1") as? CIColor)
		XCTAssertEqual(dataStructure.closeness2, compareFilter?.valueForKey("inputCloseness2") as? NSNumber)
		XCTAssertEqual(dataStructure.centerColor2, compareFilter?.valueForKey("inputCenterColor2") as? CIColor)
		XCTAssertEqual(dataStructure.closeness1, compareFilter?.valueForKey("inputCloseness1") as? NSNumber)
		XCTAssertEqual(dataStructure.closeness3, compareFilter?.valueForKey("inputCloseness3") as? NSNumber)
		XCTAssertEqual(dataStructure.replacementColor2, compareFilter?.valueForKey("inputReplacementColor2") as? CIColor)
		XCTAssertEqual(dataStructure.contrast2, compareFilter?.valueForKey("inputContrast2") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputContrast1") as? NSNumber, compareFilter?.valueForKey("inputContrast1") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputCenterColor1") as? CIColor, compareFilter?.valueForKey("inputCenterColor1") as? CIColor)
		XCTAssertEqual(generatedFilter?.valueForKey("inputContrast3") as? NSNumber, compareFilter?.valueForKey("inputContrast3") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputCenterColor3") as? CIColor, compareFilter?.valueForKey("inputCenterColor3") as? CIColor)
		XCTAssertEqual(generatedFilter?.valueForKey("inputReplacementColor3") as? CIColor, compareFilter?.valueForKey("inputReplacementColor3") as? CIColor)
		XCTAssertEqual(generatedFilter?.valueForKey("inputReplacementColor1") as? CIColor, compareFilter?.valueForKey("inputReplacementColor1") as? CIColor)
		XCTAssertEqual(generatedFilter?.valueForKey("inputCloseness2") as? NSNumber, compareFilter?.valueForKey("inputCloseness2") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputCenterColor2") as? CIColor, compareFilter?.valueForKey("inputCenterColor2") as? CIColor)
		XCTAssertEqual(generatedFilter?.valueForKey("inputCloseness1") as? NSNumber, compareFilter?.valueForKey("inputCloseness1") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputCloseness3") as? NSNumber, compareFilter?.valueForKey("inputCloseness3") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputReplacementColor2") as? CIColor, compareFilter?.valueForKey("inputReplacementColor2") as? CIColor)
		XCTAssertEqual(generatedFilter?.valueForKey("inputContrast2") as? NSNumber, compareFilter?.valueForKey("inputContrast2") as? NSNumber)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.spotColorFilter(0.98, centerColor1: CIColor(red: 0.0784, green: 0.0627, blue: 0.0706, alpha: 1.0), contrast3: 0.99, centerColor3: CIColor(red: 0.9216, green: 0.4549, blue: 0.3333, alpha: 1.0), replacementColor3: CIColor(red: 0.9098, green: 0.7529, blue: 0.6078, alpha: 1.0), replacementColor1: CIColor(red: 0.4392, green: 0.1922, blue: 0.1961, alpha: 1.0), closeness2: 0.15, centerColor2: CIColor(red: 0.5255, green: 0.3059, blue: 0.3451, alpha: 1.0), closeness1: 0.22, closeness3: 0.5, replacementColor2: CIColor(red: 0.9137, green: 0.5608, blue: 0.5059, alpha: 1.0), contrast2: 0.98)
		XCTAssertNotNil(newImage)
	}

}