import XCTest

class PDF417BarcodeGeneratorTests: XCTestCase {

	func testDataStructure() {
		let dataStructure = PDF417BarcodeGenerator(maxWidth: NSNumber(), preferredAspectRatio: NSNumber(), maxHeight: NSNumber(), dataColumns: NSNumber(), minHeight: NSNumber(), message: NSData(), minWidth: NSNumber(), rows: NSNumber(), compactionMode: NSNumber(), compactStyle: NSNumber(), correctionLevel: NSNumber(), alwaysSpecifyCompaction: NSNumber())
		XCTAssertNotNil(dataStructure.filter())
	}

}