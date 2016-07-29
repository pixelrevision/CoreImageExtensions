import XCTest

class ColorMatrixTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = ColorMatrix(biasVector: CIVector(values: [0.0, 0.0, 0.0, 0.0], count: 4), image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, aVector: CIVector(values: [0.0, 0.0, 0.0, 1.0], count: 4), gVector: CIVector(values: [0.0, 1.0, 0.0, 0.0], count: 4), bVector: CIVector(values: [0.0, 0.0, 1.0, 0.0], count: 4), rVector: CIVector(values: [1.0, 0.0, 0.0, 0.0], count: 4))
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIColorMatrix")
		XCTAssertEqual(dataStructure.biasVector, compareFilter?.valueForKey("inputBiasVector") as? CIVector)
		XCTAssertEqual(dataStructure.aVector, compareFilter?.valueForKey("inputAVector") as? CIVector)
		XCTAssertEqual(dataStructure.gVector, compareFilter?.valueForKey("inputGVector") as? CIVector)
		XCTAssertEqual(dataStructure.bVector, compareFilter?.valueForKey("inputBVector") as? CIVector)
		XCTAssertEqual(dataStructure.rVector, compareFilter?.valueForKey("inputRVector") as? CIVector)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputBiasVector") as? CIVector, compareFilter?.valueForKey("inputBiasVector") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputAVector") as? CIVector, compareFilter?.valueForKey("inputAVector") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputGVector") as? CIVector, compareFilter?.valueForKey("inputGVector") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputBVector") as? CIVector, compareFilter?.valueForKey("inputBVector") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputRVector") as? CIVector, compareFilter?.valueForKey("inputRVector") as? CIVector)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.colorMatrixFilter(CIVector(values: [0.0, 0.0, 0.0, 0.0], count: 4), aVector: CIVector(values: [0.0, 0.0, 0.0, 1.0], count: 4), gVector: CIVector(values: [0.0, 1.0, 0.0, 0.0], count: 4), bVector: CIVector(values: [0.0, 0.0, 1.0, 0.0], count: 4), rVector: CIVector(values: [1.0, 0.0, 0.0, 0.0], count: 4))
		XCTAssertNotNil(newImage)
	}

}