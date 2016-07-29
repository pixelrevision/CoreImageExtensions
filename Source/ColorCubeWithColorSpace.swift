import CoreImage 

public class ColorCubeWithColorSpace { 

	public var cubeDimension: NSNumber = 2
	public var image: CIImage
	public var cubeData: NSData
	public var colorSpace: CGColorSpaceRef

	required public init(cubeDimension: NSNumber = 2, image: CIImage, cubeData: NSData, colorSpace: CGColorSpaceRef){
		self.cubeDimension = cubeDimension
		self.image = image
		self.cubeData = cubeData
		self.colorSpace = colorSpace
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIColorCubeWithColorSpace") else { return nil }
		filter.setValue(cubeDimension, forKey: "inputCubeDimension")
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(cubeData, forKey: "inputCubeData")
		filter.setValue(colorSpace, forKey: "inputColorSpace")
		return filter
	}

}

extension CIImage {

	public func colorCubeWithColorSpaceFilter(cubeDimension: NSNumber = 2, cubeData: NSData, colorSpace: CGColorSpaceRef) -> CIImage? {
		guard let filter = CIFilter(name: "CIColorCubeWithColorSpace") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(cubeDimension, forKey: "inputCubeDimension")
		filter.setValue(cubeData, forKey: "inputCubeData")
		filter.setValue(colorSpace, forKey: "inputColorSpace")
		return filter.outputImage
	}

}