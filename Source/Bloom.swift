import CoreImage 

public class Bloom { 

	public var intensity: NSNumber = 1
	public var image: CIImage
	public var radius: NSNumber = 10

	required public init(intensity: NSNumber = 1, image: CIImage, radius: NSNumber = 10){
		self.intensity = intensity
		self.image = image
		self.radius = radius
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIBloom") else { return nil }
		filter.setValue(intensity, forKey: "inputIntensity")
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(radius, forKey: "inputRadius")
		return filter
	}

}

extension CIImage {

	public func bloomFilter(intensity: NSNumber = 1, radius: NSNumber = 10) -> CIImage? {
		guard let filter = CIFilter(name: "CIBloom") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(intensity, forKey: "inputIntensity")
		filter.setValue(radius, forKey: "inputRadius")
		return filter.outputImage
	}

}