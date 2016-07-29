import XCTest

class AffineClampTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = AffineClamp(image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, transform: NSValue(CGAffineTransform: CGAffineTransform(a: 1.0, b: 0.0, c: 0.0, d: 1.0, tx: 0.0, ty: 0.0) ))
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIAffineClamp")
		XCTAssertEqual(dataStructure.transform, compareFilter?.valueForKey("inputTransform") as? NSValue)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputTransform") as? NSValue, compareFilter?.valueForKey("inputTransform") as? NSValue)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.affineClampFilter(NSValue(CGAffineTransform: CGAffineTransform(a: 1.0, b: 0.0, c: 0.0, d: 1.0, tx: 0.0, ty: 0.0) ))
		XCTAssertNotNil(newImage)
	}

}