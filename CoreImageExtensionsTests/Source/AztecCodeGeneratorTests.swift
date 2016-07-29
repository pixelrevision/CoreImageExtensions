import XCTest

class AztecCodeGeneratorTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = AztecCodeGenerator(message: NSData(), compactStyle: NSNumber(), layers: NSNumber(), correctionLevel: 23)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIAztecCodeGenerator")
		XCTAssertEqual(dataStructure.correctionLevel, compareFilter?.valueForKey("inputCorrectionLevel") as? NSNumber)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputCorrectionLevel") as? NSNumber, compareFilter?.valueForKey("inputCorrectionLevel") as? NSNumber)
	}

}