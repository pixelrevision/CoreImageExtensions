import CoreImage 

public class TorusLensDistortion { 

	public var width: NSNumber = 80
	public var image: CIImage
	public var center: CIVector = CIVector(values: [150.0, 150.0], count: 2)
	public var refraction: NSNumber = 1.7
	public var radius: NSNumber = 160

	required public init(width: NSNumber = 80, image: CIImage, center: CIVector = CIVector(values: [150.0, 150.0], count: 2), refraction: NSNumber = 1.7, radius: NSNumber = 160){
		self.width = width
		self.image = image
		self.center = center
		self.refraction = refraction
		self.radius = radius
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CITorusLensDistortion") else { return nil }
		filter.setValue(width, forKey: "inputWidth")
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(center, forKey: "inputCenter")
		filter.setValue(refraction, forKey: "inputRefraction")
		filter.setValue(radius, forKey: "inputRadius")
		return filter
	}

}

extension CIImage {

	public func torusLensDistortionFilter(width: NSNumber = 80, center: CIVector = CIVector(values: [150.0, 150.0], count: 2), refraction: NSNumber = 1.7, radius: NSNumber = 160) -> CIImage? {
		guard let filter = CIFilter(name: "CITorusLensDistortion") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(width, forKey: "inputWidth")
		filter.setValue(center, forKey: "inputCenter")
		filter.setValue(refraction, forKey: "inputRefraction")
		filter.setValue(radius, forKey: "inputRadius")
		return filter.outputImage
	}

}