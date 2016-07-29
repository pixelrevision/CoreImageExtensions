import XCTest

class ColorPolynomialTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = ColorPolynomial(blueCoefficients: CIVector(values: [0.0, 1.0, 0.0, 0.0], count: 4), image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, greenCoefficients: CIVector(values: [0.0, 1.0, 0.0, 0.0], count: 4), alphaCoefficients: CIVector(values: [0.0, 1.0, 0.0, 0.0], count: 4), redCoefficients: CIVector(values: [0.0, 1.0, 0.0, 0.0], count: 4))
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIColorPolynomial")
		XCTAssertEqual(dataStructure.blueCoefficients, compareFilter?.valueForKey("inputBlueCoefficients") as? CIVector)
		XCTAssertEqual(dataStructure.greenCoefficients, compareFilter?.valueForKey("inputGreenCoefficients") as? CIVector)
		XCTAssertEqual(dataStructure.alphaCoefficients, compareFilter?.valueForKey("inputAlphaCoefficients") as? CIVector)
		XCTAssertEqual(dataStructure.redCoefficients, compareFilter?.valueForKey("inputRedCoefficients") as? CIVector)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputBlueCoefficients") as? CIVector, compareFilter?.valueForKey("inputBlueCoefficients") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputGreenCoefficients") as? CIVector, compareFilter?.valueForKey("inputGreenCoefficients") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputAlphaCoefficients") as? CIVector, compareFilter?.valueForKey("inputAlphaCoefficients") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputRedCoefficients") as? CIVector, compareFilter?.valueForKey("inputRedCoefficients") as? CIVector)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.colorPolynomialFilter(CIVector(values: [0.0, 1.0, 0.0, 0.0], count: 4), greenCoefficients: CIVector(values: [0.0, 1.0, 0.0, 0.0], count: 4), alphaCoefficients: CIVector(values: [0.0, 1.0, 0.0, 0.0], count: 4), redCoefficients: CIVector(values: [0.0, 1.0, 0.0, 0.0], count: 4))
		XCTAssertNotNil(newImage)
	}

}