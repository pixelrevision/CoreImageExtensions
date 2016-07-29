import CoreImage 

public class DisplacementDistortion { 

	public var displacementImage: CIImage
	public var image: CIImage
	public var scale: NSNumber = 50

	required public init(displacementImage: CIImage, image: CIImage, scale: NSNumber = 50){
		self.displacementImage = displacementImage
		self.image = image
		self.scale = scale
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIDisplacementDistortion") else { return nil }
		filter.setValue(displacementImage, forKey: "inputDisplacementImage")
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(scale, forKey: "inputScale")
		return filter
	}

}

extension CIImage {

	public func displacementDistortionFilter(displacementImage: CIImage, scale: NSNumber = 50) -> CIImage? {
		guard let filter = CIFilter(name: "CIDisplacementDistortion") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(displacementImage, forKey: "inputDisplacementImage")
		filter.setValue(scale, forKey: "inputScale")
		return filter.outputImage
	}

}