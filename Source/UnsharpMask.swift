import CoreImage 

public class UnsharpMask { 

	public var intensity: NSNumber = 0.5
	public var image: CIImage
	public var radius: NSNumber = 2.5

	required public init(intensity: NSNumber = 0.5, image: CIImage, radius: NSNumber = 2.5){
		self.intensity = intensity
		self.image = image
		self.radius = radius
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIUnsharpMask") else { return nil }
		filter.setValue(intensity, forKey: "inputIntensity")
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(radius, forKey: "inputRadius")
		return filter
	}

}

extension CIImage {

	public func unsharpMaskFilter(intensity: NSNumber = 0.5, radius: NSNumber = 2.5) -> CIImage? {
		guard let filter = CIFilter(name: "CIUnsharpMask") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(intensity, forKey: "inputIntensity")
		filter.setValue(radius, forKey: "inputRadius")
		return filter.outputImage
	}

}