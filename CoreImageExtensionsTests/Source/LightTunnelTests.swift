import XCTest

class LightTunnelTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = LightTunnel(image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, rotation: 0, center: CIVector(values: [150.0, 150.0], count: 2), radius: 100)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CILightTunnel")
		XCTAssertEqual(dataStructure.rotation, compareFilter?.valueForKey("inputRotation") as? NSNumber)
		XCTAssertEqual(dataStructure.center, compareFilter?.valueForKey("inputCenter") as? CIVector)
		XCTAssertEqual(dataStructure.radius, compareFilter?.valueForKey("inputRadius") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputRotation") as? NSNumber, compareFilter?.valueForKey("inputRotation") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputCenter") as? CIVector, compareFilter?.valueForKey("inputCenter") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputRadius") as? NSNumber, compareFilter?.valueForKey("inputRadius") as? NSNumber)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.lightTunnelFilter(0, center: CIVector(values: [150.0, 150.0], count: 2), radius: 100)
		XCTAssertNotNil(newImage)
	}

}