import XCTest

class DrosteTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = Droste(rotation: 0, strands: 1, periodicity: 1, insetPoint1: CIVector(values: [400.0, 400.0], count: 2), image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, insetPoint0: CIVector(values: [200.0, 200.0], count: 2), zoom: 1)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIDroste")
		XCTAssertEqual(dataStructure.rotation, compareFilter?.valueForKey("inputRotation") as? NSNumber)
		XCTAssertEqual(dataStructure.strands, compareFilter?.valueForKey("inputStrands") as? NSNumber)
		XCTAssertEqual(dataStructure.periodicity, compareFilter?.valueForKey("inputPeriodicity") as? NSNumber)
		XCTAssertEqual(dataStructure.insetPoint1, compareFilter?.valueForKey("inputInsetPoint1") as? CIVector)
		XCTAssertEqual(dataStructure.insetPoint0, compareFilter?.valueForKey("inputInsetPoint0") as? CIVector)
		XCTAssertEqual(dataStructure.zoom, compareFilter?.valueForKey("inputZoom") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputRotation") as? NSNumber, compareFilter?.valueForKey("inputRotation") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputStrands") as? NSNumber, compareFilter?.valueForKey("inputStrands") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputPeriodicity") as? NSNumber, compareFilter?.valueForKey("inputPeriodicity") as? NSNumber)
		XCTAssertEqual(generatedFilter?.valueForKey("inputInsetPoint1") as? CIVector, compareFilter?.valueForKey("inputInsetPoint1") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputInsetPoint0") as? CIVector, compareFilter?.valueForKey("inputInsetPoint0") as? CIVector)
		XCTAssertEqual(generatedFilter?.valueForKey("inputZoom") as? NSNumber, compareFilter?.valueForKey("inputZoom") as? NSNumber)
	}

	func testImagefilter() {
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.drosteFilter(0, strands: 1, periodicity: 1, insetPoint1: CIVector(values: [400.0, 400.0], count: 2), insetPoint0: CIVector(values: [200.0, 200.0], count: 2), zoom: 1)
		XCTAssertNotNil(newImage)
	}

}