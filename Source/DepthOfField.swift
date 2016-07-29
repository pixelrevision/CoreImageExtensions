import CoreImage 

public class DepthOfField { 

	public var point0: CIVector = CIVector(values: [0.0, 300.0], count: 2)
	public var radius: NSNumber = 6
	public var point1: CIVector = CIVector(values: [300.0, 300.0], count: 2)
	public var image: CIImage
	public var saturation: NSNumber = 1.5
	public var unsharpMaskRadius: NSNumber = 2.5
	public var unsharpMaskIntensity: NSNumber = 0.5

	required public init(point0: CIVector = CIVector(values: [0.0, 300.0], count: 2), radius: NSNumber = 6, point1: CIVector = CIVector(values: [300.0, 300.0], count: 2), image: CIImage, saturation: NSNumber = 1.5, unsharpMaskRadius: NSNumber = 2.5, unsharpMaskIntensity: NSNumber = 0.5){
		self.point0 = point0
		self.radius = radius
		self.point1 = point1
		self.image = image
		self.saturation = saturation
		self.unsharpMaskRadius = unsharpMaskRadius
		self.unsharpMaskIntensity = unsharpMaskIntensity
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIDepthOfField") else { return nil }
		filter.setValue(point0, forKey: "inputPoint0")
		filter.setValue(radius, forKey: "inputRadius")
		filter.setValue(point1, forKey: "inputPoint1")
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(saturation, forKey: "inputSaturation")
		filter.setValue(unsharpMaskRadius, forKey: "inputUnsharpMaskRadius")
		filter.setValue(unsharpMaskIntensity, forKey: "inputUnsharpMaskIntensity")
		return filter
	}

}

extension CIImage {

	public func depthOfFieldFilter(point0: CIVector = CIVector(values: [0.0, 300.0], count: 2), radius: NSNumber = 6, point1: CIVector = CIVector(values: [300.0, 300.0], count: 2), saturation: NSNumber = 1.5, unsharpMaskRadius: NSNumber = 2.5, unsharpMaskIntensity: NSNumber = 0.5) -> CIImage? {
		guard let filter = CIFilter(name: "CIDepthOfField") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(point0, forKey: "inputPoint0")
		filter.setValue(radius, forKey: "inputRadius")
		filter.setValue(point1, forKey: "inputPoint1")
		filter.setValue(saturation, forKey: "inputSaturation")
		filter.setValue(unsharpMaskRadius, forKey: "inputUnsharpMaskRadius")
		filter.setValue(unsharpMaskIntensity, forKey: "inputUnsharpMaskIntensity")
		return filter.outputImage
	}

}