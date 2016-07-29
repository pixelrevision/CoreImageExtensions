import XCTest

class ExposureAdjustTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = ExposureAdjust(eV: 0, image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIExposureAdjust")
		XCTAssertEqual(dataStructure.eV, compareFilter?.valueForKey("inputEV") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputEV") as? NSNumber, compareFilter?.valueForKey("inputEV") as? NSNumber)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.exposureAdjustFilter(0)
		XCTAssertNotNil(newImage)
	}

}