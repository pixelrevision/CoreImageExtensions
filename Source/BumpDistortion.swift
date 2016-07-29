import CoreImage 

public class BumpDistortion { 

	public var image: CIImage
	public var center: CIVector = CIVector(values: [150.0, 150.0], count: 2)
	public var scale: NSNumber = 0.5
	public var radius: NSNumber = 300

	required public init(image: CIImage, center: CIVector = CIVector(values: [150.0, 150.0], count: 2), scale: NSNumber = 0.5, radius: NSNumber = 300){
		self.image = image
		self.center = center
		self.scale = scale
		self.radius = radius
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIBumpDistortion") else { return nil }
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(center, forKey: "inputCenter")
		filter.setValue(scale, forKey: "inputScale")
		filter.setValue(radius, forKey: "inputRadius")
		return filter
	}

}

extension CIImage {

	public func bumpDistortionFilter(center: CIVector = CIVector(values: [150.0, 150.0], count: 2), scale: NSNumber = 0.5, radius: NSNumber = 300) -> CIImage? {
		guard let filter = CIFilter(name: "CIBumpDistortion") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(center, forKey: "inputCenter")
		filter.setValue(scale, forKey: "inputScale")
		filter.setValue(radius, forKey: "inputRadius")
		return filter.outputImage
	}

}