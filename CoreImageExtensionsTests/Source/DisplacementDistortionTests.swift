import XCTest

class DisplacementDistortionTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = DisplacementDistortion(displacementImage: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, scale: 50)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIDisplacementDistortion")
		XCTAssertEqual(dataStructure.scale, compareFilter?.valueForKey("inputScale") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputScale") as? NSNumber, compareFilter?.valueForKey("inputScale") as? NSNumber)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.displacementDistortionFilter(CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, scale: 50)
		XCTAssertNotNil(newImage)
	}

}