import XCTest

class ColorCubeWithColorSpaceTests: XCTestCase {
	
	var cubeData: NSData!
	override func setUp() {
		super.setUp()
		let colorCubeData: [Float] = [
			0, 0, 0, 1,
			1, 0, 0, 1,
			0, 1, 0, 1,
			1, 1, 0, 1,
			0, 0, 1, 1,
			1, 0, 1, 1,
			0, 1, 1, 1,
			1, 1, 1, 1
		]
		cubeData = NSData(bytes: colorCubeData, length: colorCubeData.count * sizeof(Float))
	}

	func testDataStructure() {
		let colorSpace = CGColorSpaceCreateDeviceRGB()!
		let dataStructure = ColorCubeWithColorSpace(cubeDimension: 2, image: CIImage(name: "sample_image_1", classForBundle: self.dynamicType)!, cubeData: cubeData, colorSpace: colorSpace)
		XCTAssertNotNil(dataStructure.filter())

		let compareFilter = CIFilter(name: "CIColorCubeWithColorSpace")
		compareFilter?.setValue(cubeData, forKey: "inputCubeData")
		XCTAssertEqual(dataStructure.cubeDimension, compareFilter?.valueForKey("inputCubeDimension") as? NSNumber)
		compareFilter?.setValue(colorSpace, forKey: "inputColorSpace")

		let generatedFilter = dataStructure.filter()
		XCTAssertEqual(generatedFilter?.valueForKey("inputCubeDimension") as? NSNumber, compareFilter?.valueForKey("inputCubeDimension") as? NSNumber)

		let imageCompareResults = AssertFilterEqualityForImages(dataStructure.filter(), filter2: compareFilter, classForBundle: self.dynamicType)
		XCTAssert(imageCompareResults.passes, imageCompareResults.message)
	}

	func testImagefilter() {
		let colorSpace = CGColorSpaceCreateDeviceRGB()!
		let newImage = CIImage(name: "sample_image_1", classForBundle: self.dynamicType)?.colorCubeWithColorSpaceFilter(2, cubeData: cubeData, colorSpace: colorSpace)
		XCTAssertNotNil(newImage)
	}

}