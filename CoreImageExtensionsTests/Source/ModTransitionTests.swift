import XCTest

class ModTransitionTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = ModTransition(targetImage: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, center: CIVector(values: [150.0, 150.0], count: 2), angle: 2, radius: 150, time: 0, compression: 300, image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIModTransition")
		XCTAssertEqual(dataStructure.center, compareFilter?.valueForKey("inputCenter") as? CIVector)
		XCTAssertEqual(dataStructure.angle, compareFilter?.valueForKey("inputAngle") as? NSNumber)
		XCTAssertEqual(dataStructure.radius, compareFilter?.valueForKey("inputRadius") as? NSNumber)
		XCTAssertEqual(dataStructure.time, compareFilter?.valueForKey("inputTime") as? NSNumber)
		XCTAssertEqual(dataStructure.compression, compareFilter?.valueForKey("inputCompression") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputCenter") as? CIVector, compareFilter?.valueForKey("inputCenter") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputAngle") as? NSNumber, compareFilter?.valueForKey("inputAngle") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputRadius") as? NSNumber, compareFilter?.valueForKey("inputRadius") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputTime") as? NSNumber, compareFilter?.valueForKey("inputTime") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputCompression") as? NSNumber, compareFilter?.valueForKey("inputCompression") as? NSNumber)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.modTransitionFilter(CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, center: CIVector(values: [150.0, 150.0], count: 2), angle: 2, radius: 150, time: 0, compression: 300)
		XCTAssertNotNil(newImage)
	}

}