import XCTest

class DissolveTransitionTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = DissolveTransition(image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, targetImage: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, time: 0)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIDissolveTransition")
		XCTAssertEqual(dataStructure.time, compareFilter?.valueForKey("inputTime") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputTime") as? NSNumber, compareFilter?.valueForKey("inputTime") as? NSNumber)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.dissolveTransitionFilter(CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, time: 0)
		XCTAssertNotNil(newImage)
	}

}