import CoreImage 

public class ModTransition { 

	public var targetImage: CIImage
	public var center: CIVector = CIVector(values: [150.0, 150.0], count: 2)
	public var angle: NSNumber = 2
	public var radius: NSNumber = 150
	public var time: NSNumber = 0
	public var compression: NSNumber = 300
	public var image: CIImage

	required public init(targetImage: CIImage, center: CIVector = CIVector(values: [150.0, 150.0], count: 2), angle: NSNumber = 2, radius: NSNumber = 150, time: NSNumber = 0, compression: NSNumber = 300, image: CIImage){
		self.targetImage = targetImage
		self.center = center
		self.angle = angle
		self.radius = radius
		self.time = time
		self.compression = compression
		self.image = image
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIModTransition") else { return nil }
		filter.setValue(targetImage, forKey: "inputTargetImage")
		filter.setValue(center, forKey: "inputCenter")
		filter.setValue(angle, forKey: "inputAngle")
		filter.setValue(radius, forKey: "inputRadius")
		filter.setValue(time, forKey: "inputTime")
		filter.setValue(compression, forKey: "inputCompression")
		filter.setValue(image, forKey: "inputImage")
		return filter
	}

}

extension CIImage {

	public func modTransitionFilter(targetImage: CIImage, center: CIVector = CIVector(values: [150.0, 150.0], count: 2), angle: NSNumber = 2, radius: NSNumber = 150, time: NSNumber = 0, compression: NSNumber = 300) -> CIImage? {
		guard let filter = CIFilter(name: "CIModTransition") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(targetImage, forKey: "inputTargetImage")
		filter.setValue(center, forKey: "inputCenter")
		filter.setValue(angle, forKey: "inputAngle")
		filter.setValue(radius, forKey: "inputRadius")
		filter.setValue(time, forKey: "inputTime")
		filter.setValue(compression, forKey: "inputCompression")
		return filter.outputImage
	}

}