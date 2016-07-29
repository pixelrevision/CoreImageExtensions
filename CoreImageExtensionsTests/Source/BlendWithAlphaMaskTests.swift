import XCTest

class BlendWithAlphaMaskTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = BlendWithAlphaMask(image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, maskImage: CIImage(name: "sample_image_2", classForBundle: self.dynamicType)!, backgroundImage: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIBlendWithAlphaMask")
		compareFilter?.setValue(CIImage(name: "sample_image_2", classForBundle: self.dynamicType)!, forKey: kCIInputMaskImageKey)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.blendWithAlphaMaskFilter(CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, backgroundImage: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!)
		XCTAssertNotNil(newImage)
	}

}