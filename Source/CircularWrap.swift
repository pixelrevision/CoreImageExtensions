import CoreImage 

public class CircularWrap { 

	public var image: CIImage
	public var center: CIVector = CIVector(values: [150.0, 150.0], count: 2)
	public var angle: NSNumber = 0
	public var radius: NSNumber = 150

	required public init(image: CIImage, center: CIVector = CIVector(values: [150.0, 150.0], count: 2), angle: NSNumber = 0, radius: NSNumber = 150){
		self.image = image
		self.center = center
		self.angle = angle
		self.radius = radius
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CICircularWrap") else { return nil }
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(center, forKey: "inputCenter")
		filter.setValue(angle, forKey: "inputAngle")
		filter.setValue(radius, forKey: "inputRadius")
		return filter
	}

}

extension CIImage {

	public func circularWrapFilter(center: CIVector = CIVector(values: [150.0, 150.0], count: 2), angle: NSNumber = 0, radius: NSNumber = 150) -> CIImage? {
		guard let filter = CIFilter(name: "CICircularWrap") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(center, forKey: "inputCenter")
		filter.setValue(angle, forKey: "inputAngle")
		filter.setValue(radius, forKey: "inputRadius")
		return filter.outputImage
	}

}