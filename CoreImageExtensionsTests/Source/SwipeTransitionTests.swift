import XCTest

class SwipeTransitionTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = SwipeTransition(width: 300, targetImage: CIImage(name: "sample_image_2", classForBundle: self.dynamicType)!, angle: 0, time: 0, color: CIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), extent: CIVector(values: [0.0, 0.0, 300.0, 300.0], count: 4), image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, opacity: 0)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CISwipeTransition")
		compareFilter?.setValue(CIImage(name: "sample_image_2", classForBundle: self.dynamicType)!, forKey: kCIInputTargetImageKey)
		XCTAssertEqual(dataStructure.width, compareFilter?.valueForKey("inputWidth") as? NSNumber)
		XCTAssertEqual(dataStructure.angle, compareFilter?.valueForKey("inputAngle") as? NSNumber)
		XCTAssertEqual(dataStructure.time, compareFilter?.valueForKey("inputTime") as? NSNumber)
		XCTAssertEqual(dataStructure.color, compareFilter?.valueForKey("inputColor") as? CIColor)
		XCTAssertEqual(dataStructure.extent, compareFilter?.valueForKey("inputExtent") as? CIVector)
		XCTAssertEqual(dataStructure.opacity, compareFilter?.valueForKey("inputOpacity") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputWidth") as? NSNumber, compareFilter?.valueForKey("inputWidth") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputAngle") as? NSNumber, compareFilter?.valueForKey("inputAngle") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputTime") as? NSNumber, compareFilter?.valueForKey("inputTime") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputColor") as? CIColor, compareFilter?.valueForKey("inputColor") as? CIColor)
		XCTAssertEqual(generatedFilter?.valueForKey("inputExtent") as? CIVector, compareFilter?.valueForKey("inputExtent") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputOpacity") as? NSNumber, compareFilter?.valueForKey("inputOpacity") as? NSNumber)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.swipeTransitionFilter(300, targetImage: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, angle: 0, time: 0, color: CIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), extent: CIVector(values: [0.0, 0.0, 300.0, 300.0], count: 4), opacity: 0)
		XCTAssertNotNil(newImage)
	}

}