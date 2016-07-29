import XCTest

class StretchCropTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = StretchCrop(size: CIVector(values: [1280.0, 720.0], count: 2), image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, cropAmount: 0.25, centerStretchAmount: 0.25)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIStretchCrop")
		XCTAssertEqual(dataStructure.size, compareFilter?.valueForKey("inputSize") as? CIVector)
		XCTAssertEqual(dataStructure.cropAmount, compareFilter?.valueForKey("inputCropAmount") as? NSNumber)
		XCTAssertEqual(dataStructure.centerStretchAmount, compareFilter?.valueForKey("inputCenterStretchAmount") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputSize") as? CIVector, compareFilter?.valueForKey("inputSize") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputCropAmount") as? NSNumber, compareFilter?.valueForKey("inputCropAmount") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputCenterStretchAmount") as? NSNumber, compareFilter?.valueForKey("inputCenterStretchAmount") as? NSNumber)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.stretchCropFilter(CIVector(values: [1280.0, 720.0], count: 2), cropAmount: 0.25, centerStretchAmount: 0.25)
		XCTAssertNotNil(newImage)
	}

}