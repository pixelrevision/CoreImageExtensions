import XCTest

class CropTests: XCTestCase {

	func testDataStructure() {
		
		let dataStructure = Crop(image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, rectangle: CIVector(values: [0, 0, 300, 300], count: 4))
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CICrop")
		// documentation claims that rectangle is [0 0 300 300] but it looks like the rect is actually infinite bounds.  If changes to core grapics happen we want to pick that up.
		// the default in core image shows -8.98846567431158e+307, -8.98846567431158e+307, 1.79769313486232e+308, 1.79769313486232e+308
		XCTAssertNotEqual(dataStructure.rectangle, compareFilter?.valueForKey("inputRectangle") as? CIVector)
		// documentation claims that rectangle is [0 0 300 300] but it looks like the rect is actually infinite bounds. If changes to core grapics happen we want to pick that up.
		// the default in core image shows -8.98846567431158e+307, -8.98846567431158e+307, 1.79769313486232e+308, 1.79769313486232e+308
		let generatedFilter = dataStructure.filter()
		XCTAssertNotEqual(generatedFilter?.valueForKey("inputRectangle") as? CIVector, compareFilter?.valueForKey("inputRectangle") as? CIVector)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.cropFilter(CIVector(values: [0, 0, 300, 300], count: 4))
		XCTAssertNotNil(newImage)
	}

}