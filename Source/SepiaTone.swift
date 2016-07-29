import CoreImage 

public class SepiaTone { 

	public var intensity: NSNumber = 1
	public var image: CIImage

	required public init(intensity: NSNumber = 1, image: CIImage){
		self.intensity = intensity
		self.image = image
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CISepiaTone") else { return nil }
		filter.setValue(intensity, forKey: "inputIntensity")
		filter.setValue(image, forKey: "inputImage")
		return filter
	}

}

extension CIImage {

	public func sepiaToneFilter(intensity: NSNumber = 1) -> CIImage? {
		guard let filter = CIFilter(name: "CISepiaTone") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(intensity, forKey: "inputIntensity")
		return filter.outputImage
	}

}