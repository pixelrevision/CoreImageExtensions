import CoreImage 

public class GlassLozenge { 

	public var point1: CIVector = CIVector(values: [350.0, 150.0], count: 2)
	public var image: CIImage
	public var refraction: NSNumber = 1.7
	public var radius: NSNumber = 100
	public var point0: CIVector = CIVector(values: [150.0, 150.0], count: 2)

	required public init(point1: CIVector = CIVector(values: [350.0, 150.0], count: 2), image: CIImage, refraction: NSNumber = 1.7, radius: NSNumber = 100, point0: CIVector = CIVector(values: [150.0, 150.0], count: 2)){
		self.point1 = point1
		self.image = image
		self.refraction = refraction
		self.radius = radius
		self.point0 = point0
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIGlassLozenge") else { return nil }
		filter.setValue(point1, forKey: "inputPoint1")
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(refraction, forKey: "inputRefraction")
		filter.setValue(radius, forKey: "inputRadius")
		filter.setValue(point0, forKey: "inputPoint0")
		return filter
	}

}

extension CIImage {

	public func glassLozengeFilter(point1: CIVector = CIVector(values: [350.0, 150.0], count: 2), refraction: NSNumber = 1.7, radius: NSNumber = 100, point0: CIVector = CIVector(values: [150.0, 150.0], count: 2)) -> CIImage? {
		guard let filter = CIFilter(name: "CIGlassLozenge") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(point1, forKey: "inputPoint1")
		filter.setValue(refraction, forKey: "inputRefraction")
		filter.setValue(radius, forKey: "inputRadius")
		filter.setValue(point0, forKey: "inputPoint0")
		return filter.outputImage
	}

}