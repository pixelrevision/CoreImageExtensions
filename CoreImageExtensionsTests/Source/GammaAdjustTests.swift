import XCTest

class GammaAdjustTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = GammaAdjust(power: 1, image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIGammaAdjust")
		XCTAssertEqual(dataStructure.power, compareFilter?.valueForKey("inputPower") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputPower") as? NSNumber, compareFilter?.valueForKey("inputPower") as? NSNumber)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.gammaAdjustFilter(1)
		XCTAssertNotNil(newImage)
	}

}