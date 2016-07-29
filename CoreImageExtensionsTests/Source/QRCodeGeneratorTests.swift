import XCTest

class QRCodeGeneratorTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = QRCodeGenerator(message: NSData(), correctionLevel: "M")
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIQRCodeGenerator")
		XCTAssertEqual(dataStructure.correctionLevel, compareFilter?.valueForKey("inputCorrectionLevel") as? NSString)

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputCorrectionLevel") as? NSString, compareFilter?.valueForKey("inputCorrectionLevel") as? NSString)
	}

}