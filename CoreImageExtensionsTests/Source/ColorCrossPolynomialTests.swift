import XCTest

class ColorCrossPolynomialTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = ColorCrossPolynomial(blueCoefficients: CIVector(values: [0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], count: 10), greenCoefficients: CIVector(values: [0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], count: 10), image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, redCoefficients: CIVector(values: [1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], count: 10))
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIColorCrossPolynomial")
		XCTAssertEqual(dataStructure.blueCoefficients, compareFilter?.valueForKey("inputBlueCoefficients") as? CIVector)
		XCTAssertEqual(dataStructure.greenCoefficients, compareFilter?.valueForKey("inputGreenCoefficients") as? CIVector)
		XCTAssertEqual(dataStructure.redCoefficients, compareFilter?.valueForKey("inputRedCoefficients") as? CIVector)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputBlueCoefficients") as? CIVector, compareFilter?.valueForKey("inputBlueCoefficients") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputGreenCoefficients") as? CIVector, compareFilter?.valueForKey("inputGreenCoefficients") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputRedCoefficients") as? CIVector, compareFilter?.valueForKey("inputRedCoefficients") as? CIVector)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.colorCrossPolynomialFilter(CIVector(values: [0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], count: 10), greenCoefficients: CIVector(values: [0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], count: 10), redCoefficients: CIVector(values: [1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], count: 10))
		XCTAssertNotNil(newImage)
	}

}