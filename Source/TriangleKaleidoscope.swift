import CoreImage 

public class TriangleKaleidoscope { 

	public var size: NSNumber = 700
	public var image: CIImage
	public var rotation: NSNumber = 5.924285296593801
	public var decay: NSNumber = 0.85
	public var point: CIVector = CIVector(values: [150.0, 150.0], count: 2)

	required public init(size: NSNumber = 700, image: CIImage, rotation: NSNumber = 5.924285296593801, decay: NSNumber = 0.85, point: CIVector = CIVector(values: [150.0, 150.0], count: 2)){
		self.size = size
		self.image = image
		self.rotation = rotation
		self.decay = decay
		self.point = point
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CITriangleKaleidoscope") else { return nil }
		filter.setValue(size, forKey: "inputSize")
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(rotation, forKey: "inputRotation")
		filter.setValue(decay, forKey: "inputDecay")
		filter.setValue(point, forKey: "inputPoint")
		return filter
	}

}

extension CIImage {

	public func triangleKaleidoscopeFilter(size: NSNumber = 700, rotation: NSNumber = 5.924285296593801, decay: NSNumber = 0.85, point: CIVector = CIVector(values: [150.0, 150.0], count: 2)) -> CIImage? {
		guard let filter = CIFilter(name: "CITriangleKaleidoscope") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(size, forKey: "inputSize")
		filter.setValue(rotation, forKey: "inputRotation")
		filter.setValue(decay, forKey: "inputDecay")
		filter.setValue(point, forKey: "inputPoint")
		return filter.outputImage
	}

}