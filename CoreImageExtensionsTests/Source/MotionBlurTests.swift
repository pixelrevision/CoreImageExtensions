import XCTest

class MotionBlurTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = MotionBlur(image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, angle: 0, radius: 20)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIMotionBlur")
		XCTAssertEqual(dataStructure.angle, compareFilter?.valueForKey("inputAngle") as? NSNumber)
		XCTAssertEqual(dataStructure.radius, compareFilter?.valueForKey("inputRadius") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputAngle") as? NSNumber, compareFilter?.valueForKey("inputAngle") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputRadius") as? NSNumber, compareFilter?.valueForKey("inputRadius") as? NSNumber)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.motionBlurFilter(0, radius: 20)
		XCTAssertNotNil(newImage)
	}

}