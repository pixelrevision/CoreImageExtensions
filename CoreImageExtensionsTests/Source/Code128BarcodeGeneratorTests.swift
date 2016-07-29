import XCTest

class Code128BarcodeGeneratorTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = Code128BarcodeGenerator(message: NSData(), quietSpace: 7)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CICode128BarcodeGenerator")
		XCTAssertEqual(dataStructure.quietSpace, compareFilter?.valueForKey("inputQuietSpace") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputQuietSpace") as? NSNumber, compareFilter?.valueForKey("inputQuietSpace") as? NSNumber)
	}

}