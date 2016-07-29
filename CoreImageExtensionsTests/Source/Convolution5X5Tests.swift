import XCTest

class Convolution5X5Tests: XCTestCase {

	func testDataStructure() {
		let dataStructure = Convolution5X5(bias: 0, image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, weights: CIVector(values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], count: 25))
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIConvolution5X5")
		XCTAssertEqual(dataStructure.bias, compareFilter?.valueForKey("inputBias") as? NSNumber)
		XCTAssertEqual(dataStructure.weights, compareFilter?.valueForKey("inputWeights") as? CIVector)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputBias") as? NSNumber, compareFilter?.valueForKey("inputBias") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputWeights") as? CIVector, compareFilter?.valueForKey("inputWeights") as? CIVector)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.convolution5X5Filter(0, weights: CIVector(values: [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], count: 25))
		XCTAssertNotNil(newImage)
	}

}