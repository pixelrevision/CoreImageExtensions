import XCTest

class ShadedMaterialTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = ShadedMaterial(image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, shadingImage: CIImage(name: "sample_image_2", classForBundle: self.dynamicType)!, scale: 10)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIShadedMaterial")
		compareFilter?.setValue(CIImage(name: "sample_image_2", classForBundle: self.dynamicType)!, forKey: kCIInputShadingImageKey)
		XCTAssertEqual(dataStructure.scale, compareFilter?.valueForKey("inputScale") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputScale") as? NSNumber, compareFilter?.valueForKey("inputScale") as? NSNumber)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.shadedMaterialFilter(CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, scale: 10)
		XCTAssertNotNil(newImage)
	}

}