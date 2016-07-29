import XCTest

class AccordionFoldTransitionTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = AccordionFoldTransition(foldShadowAmount: 0.1, targetImage: CIImage(name: "sample_image_2", classForBundle: self.dynamicType)!, numberOfFolds: 3, image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, bottomHeight: 0, time: 0)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIAccordionFoldTransition")
		compareFilter?.setValue(CIImage(name: "sample_image_2", classForBundle: self.dynamicType)!, forKey: kCIInputTargetImageKey)
		XCTAssertEqual(dataStructure.foldShadowAmount, compareFilter?.valueForKey("inputFoldShadowAmount") as? NSNumber)
		XCTAssertEqual(dataStructure.numberOfFolds, compareFilter?.valueForKey("inputNumberOfFolds") as? NSNumber)
		XCTAssertEqual(dataStructure.bottomHeight, compareFilter?.valueForKey("inputBottomHeight") as? NSNumber)
		XCTAssertEqual(dataStructure.time, compareFilter?.valueForKey("inputTime") as? NSNumber)
		

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputFoldShadowAmount") as? NSNumber, compareFilter?.valueForKey("inputFoldShadowAmount") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputNumberOfFolds") as? NSNumber, compareFilter?.valueForKey("inputNumberOfFolds") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputBottomHeight") as? NSNumber, compareFilter?.valueForKey("inputBottomHeight") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputTime") as? NSNumber, compareFilter?.valueForKey("inputTime") as? NSNumber)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.accordionFoldTransitionFilter(0.1, targetImage: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, numberOfFolds: 3, bottomHeight: 0, time: 0)
		XCTAssertNotNil(newImage)
	}

}