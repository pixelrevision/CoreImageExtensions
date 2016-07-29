import XCTest

class HistogramDisplayFilterTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = HistogramDisplayFilter(image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, lowLimit: 0, highLimit: 1, height: 100)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIHistogramDisplayFilter")
		XCTAssertEqual(dataStructure.lowLimit, compareFilter?.valueForKey("inputLowLimit") as? NSNumber)
		XCTAssertEqual(dataStructure.highLimit, compareFilter?.valueForKey("inputHighLimit") as? NSNumber)
		XCTAssertEqual(dataStructure.height, compareFilter?.valueForKey("inputHeight") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputLowLimit") as? NSNumber, compareFilter?.valueForKey("inputLowLimit") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputHighLimit") as? NSNumber, compareFilter?.valueForKey("inputHighLimit") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputHeight") as? NSNumber, compareFilter?.valueForKey("inputHeight") as? NSNumber)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.histogramDisplayFilterFilter(0, highLimit: 1, height: 100)
		XCTAssertNotNil(newImage)
	}

}