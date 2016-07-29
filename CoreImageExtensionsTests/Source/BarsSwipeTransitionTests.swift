import XCTest

class BarsSwipeTransitionTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = BarsSwipeTransition(width: 30, targetImage: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, barOffset: 10, angle: 3.141592653589793, image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, time: 0)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIBarsSwipeTransition")
		XCTAssertEqual(dataStructure.width, compareFilter?.valueForKey("inputWidth") as? NSNumber)
		XCTAssertEqual(dataStructure.barOffset, compareFilter?.valueForKey("inputBarOffset") as? NSNumber)
		XCTAssertEqual(dataStructure.angle, compareFilter?.valueForKey("inputAngle") as? NSNumber)
		XCTAssertEqual(dataStructure.time, compareFilter?.valueForKey("inputTime") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputWidth") as? NSNumber, compareFilter?.valueForKey("inputWidth") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputBarOffset") as? NSNumber, compareFilter?.valueForKey("inputBarOffset") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputAngle") as? NSNumber, compareFilter?.valueForKey("inputAngle") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputTime") as? NSNumber, compareFilter?.valueForKey("inputTime") as? NSNumber)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.barsSwipeTransitionFilter(30, targetImage: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, barOffset: 10, angle: 3.141592653589793, time: 0)
		XCTAssertNotNil(newImage)
	}

}