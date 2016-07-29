import CoreImage 

public class CircularScreen { 

	public var width: NSNumber = 6
	public var image: CIImage
	public var sharpness: NSNumber = 0.7
	public var center: CIVector = CIVector(values: [150.0, 150.0], count: 2)

	required public init(width: NSNumber = 6, image: CIImage, sharpness: NSNumber = 0.7, center: CIVector = CIVector(values: [150.0, 150.0], count: 2)){
		self.width = width
		self.image = image
		self.sharpness = sharpness
		self.center = center
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CICircularScreen") else { return nil }
		filter.setValue(width, forKey: "inputWidth")
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(sharpness, forKey: "inputSharpness")
		filter.setValue(center, forKey: "inputCenter")
		return filter
	}

}

extension CIImage {

	public func circularScreenFilter(width: NSNumber = 6, sharpness: NSNumber = 0.7, center: CIVector = CIVector(values: [150.0, 150.0], count: 2)) -> CIImage? {
		guard let filter = CIFilter(name: "CICircularScreen") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(width, forKey: "inputWidth")
		filter.setValue(sharpness, forKey: "inputSharpness")
		filter.setValue(center, forKey: "inputCenter")
		return filter.outputImage
	}

}