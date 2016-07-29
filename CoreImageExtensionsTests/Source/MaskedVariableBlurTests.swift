import XCTest

class MaskedVariableBlurTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = MaskedVariableBlur(image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, mask: CIImage(name: "sample_image_2", classForBundle: self.dynamicType)!, radius: 5)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIMaskedVariableBlur")
		compareFilter?.setValue(CIImage(name: "sample_image_2", classForBundle: self.dynamicType)!, forKey: "inputMask")
		XCTAssertEqual(dataStructure.radius, compareFilter?.valueForKey("inputRadius") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputRadius") as? NSNumber, compareFilter?.valueForKey("inputRadius") as? NSNumber)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.maskedVariableBlurFilter(CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, radius: 5)
		XCTAssertNotNil(newImage)
	}

}