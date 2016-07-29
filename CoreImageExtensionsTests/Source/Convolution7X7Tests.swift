import XCTest

class Convolution7X7Tests: XCTestCase {

	func testDataStructure() {
		let dataStructure = Convolution7X7(bias: 0, image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, weights: CIVector(values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], count: 49))
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIConvolution7X7")
		XCTAssertEqual(dataStructure.bias, compareFilter?.valueForKey("inputBias") as? NSNumber)
		XCTAssertEqual(dataStructure.weights, compareFilter?.valueForKey("inputWeights") as? CIVector)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputBias") as? NSNumber, compareFilter?.valueForKey("inputBias") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputWeights") as? CIVector, compareFilter?.valueForKey("inputWeights") as? CIVector)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.convolution7X7Filter(0, weights: CIVector(values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], count: 49))
		XCTAssertNotNil(newImage)
	}

}