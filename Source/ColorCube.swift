import CoreImage 

public class ColorCube { 

	public var cubeDimension: NSNumber = 2
	public var image: CIImage
	public var cubeData: NSData

	required public init(cubeDimension: NSNumber = 2, image: CIImage, cubeData: NSData){
		self.cubeDimension = cubeDimension
		self.image = image
		self.cubeData = cubeData
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIColorCube") else { return nil }
		filter.setValue(cubeDimension, forKey: "inputCubeDimension")
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(cubeData, forKey: "inputCubeData")
		return filter
	}

}

extension CIImage {

	public func colorCubeFilter(cubeDimension: NSNumber = 2, cubeData: NSData) -> CIImage? {
		guard let filter = CIFilter(name: "CIColorCube") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(cubeDimension, forKey: "inputCubeDimension")
		filter.setValue(cubeData, forKey: "inputCubeData")
		return filter.outputImage
	}

}