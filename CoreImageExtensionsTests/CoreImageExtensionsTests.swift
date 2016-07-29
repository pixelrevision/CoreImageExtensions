import XCTest

@testable import CoreImageExtensions

class CoreImageExtensionsTests: XCTestCase {
    
    func checkRuntimeParams() {}
	
	func testImageEquality() {
		let image1 = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)
		let image2 = CIImage(name: "sample_image_2", classForBundle: self.dynamicType)
		let image3 = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)
		XCTAssertNotNil(image1)
		XCTAssertNotNil(image2)
		XCTAssertNotEqual(image1, image2)
		XCTAssertNotNil(image3)
		XCTAssertEqual(image1, image3)
		
		let rendered1 = applyFilter(image1!)
		let rendered2 = applyFilter(image2!)
		let rendered3 = applyFilter(image3!)

		XCTAssertNotEqual(rendered1, rendered2)
		XCTAssertEqual(rendered1, rendered3)
	}
	
	func applyFilter(image: CIImage) -> CIImage {
		let ctx = CIContext(options: [:])
		let filter = CIFilter(name: "CIBoxBlur", withInputParameters: [kCIInputImageKey: image])
		let new = ctx.createCGImage(filter!.outputImage!, fromRect: image.extent)
		return CIImage(CGImage: new)
	}
}
