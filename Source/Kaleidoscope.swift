import CoreImage 

public class Kaleidoscope { 

	public var count: NSNumber = 6
	public var image: CIImage
	public var center: CIVector = CIVector(values: [150.0, 150.0], count: 2)
	public var angle: NSNumber = 0

	required public init(count: NSNumber = 6, image: CIImage, center: CIVector = CIVector(values: [150.0, 150.0], count: 2), angle: NSNumber = 0){
		self.count = count
		self.image = image
		self.center = center
		self.angle = angle
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIKaleidoscope") else { return nil }
		filter.setValue(count, forKey: "inputCount")
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(center, forKey: "inputCenter")
		filter.setValue(angle, forKey: "inputAngle")
		return filter
	}

}

extension CIImage {

	public func kaleidoscopeFilter(count: NSNumber = 6, center: CIVector = CIVector(values: [150.0, 150.0], count: 2), angle: NSNumber = 0) -> CIImage? {
		guard let filter = CIFilter(name: "CIKaleidoscope") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(count, forKey: "inputCount")
		filter.setValue(center, forKey: "inputCenter")
		filter.setValue(angle, forKey: "inputAngle")
		return filter.outputImage
	}

}