import CoreImage 

public class TwelvefoldReflectedTile { 

	public var width: NSNumber = 100
	public var image: CIImage
	public var center: CIVector = CIVector(values: [150.0, 150.0], count: 2)
	public var angle: NSNumber = 0

	required public init(width: NSNumber = 100, image: CIImage, center: CIVector = CIVector(values: [150.0, 150.0], count: 2), angle: NSNumber = 0){
		self.width = width
		self.image = image
		self.center = center
		self.angle = angle
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CITwelvefoldReflectedTile") else { return nil }
		filter.setValue(width, forKey: "inputWidth")
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(center, forKey: "inputCenter")
		filter.setValue(angle, forKey: "inputAngle")
		return filter
	}

}

extension CIImage {

	public func twelvefoldReflectedTileFilter(width: NSNumber = 100, center: CIVector = CIVector(values: [150.0, 150.0], count: 2), angle: NSNumber = 0) -> CIImage? {
		guard let filter = CIFilter(name: "CITwelvefoldReflectedTile") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(width, forKey: "inputWidth")
		filter.setValue(center, forKey: "inputCenter")
		filter.setValue(angle, forKey: "inputAngle")
		return filter.outputImage
	}

}