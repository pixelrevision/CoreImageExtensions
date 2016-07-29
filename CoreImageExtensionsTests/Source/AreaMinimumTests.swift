import XCTest

class AreaMinimumTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = AreaMinimum(image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, extent: CIVector(values: [0.0, 0.0, 640.0, 80.0], count: 4))
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIAreaMinimum")
		XCTAssertEqual(dataStructure.extent, compareFilter?.valueForKey("inputExtent") as? CIVector)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputExtent") as? CIVector, compareFilter?.valueForKey("inputExtent") as? CIVector)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.areaMinimumFilter(CIVector(values: [0.0, 0.0, 640.0, 80.0], count: 4))
		XCTAssertNotNil(newImage)
	}

}