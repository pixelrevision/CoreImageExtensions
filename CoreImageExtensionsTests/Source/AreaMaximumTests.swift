import XCTest

class AreaMaximumTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = AreaMaximum(image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, extent: CIVector(values: [0.0, 0.0, 640.0, 80.0], count: 4))
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIAreaMaximum")
		XCTAssertEqual(dataStructure.extent, compareFilter?.valueForKey("inputExtent") as? CIVector)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputExtent") as? CIVector, compareFilter?.valueForKey("inputExtent") as? CIVector)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.areaMaximumFilter(CIVector(values: [0.0, 0.0, 640.0, 80.0], count: 4))
		XCTAssertNotNil(newImage)
	}

}