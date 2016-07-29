import XCTest

class VibranceTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = Vibrance(image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, amount: 0)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIVibrance")
		XCTAssertEqual(dataStructure.amount, compareFilter?.valueForKey("inputAmount") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputAmount") as? NSNumber, compareFilter?.valueForKey("inputAmount") as? NSNumber)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.vibranceFilter(0)
		XCTAssertNotNil(newImage)
	}

}