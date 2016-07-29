import XCTest

class Convolution9HorizontalTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = Convolution9Horizontal(bias: 0, image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, weights: CIVector(values: [0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0], count: 9))
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIConvolution9Horizontal")
		XCTAssertEqual(dataStructure.bias, compareFilter?.valueForKey("inputBias") as? NSNumber)
		XCTAssertEqual(dataStructure.weights, compareFilter?.valueForKey("inputWeights") as? CIVector)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputBias") as? NSNumber, compareFilter?.valueForKey("inputBias") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputWeights") as? CIVector, compareFilter?.valueForKey("inputWeights") as? CIVector)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.convolution9HorizontalFilter(0, weights: CIVector(values: [0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0], count: 9))
		XCTAssertNotNil(newImage)
	}

}