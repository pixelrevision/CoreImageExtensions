import CoreImage 

public class NoiseReduction { 

	public var noiseLevel: NSNumber = 0.02
	public var image: CIImage
	public var sharpness: NSNumber = 0.4

	required public init(noiseLevel: NSNumber = 0.02, image: CIImage, sharpness: NSNumber = 0.4){
		self.noiseLevel = noiseLevel
		self.image = image
		self.sharpness = sharpness
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CINoiseReduction") else { return nil }
		filter.setValue(noiseLevel, forKey: "inputNoiseLevel")
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(sharpness, forKey: "inputSharpness")
		return filter
	}

}

extension CIImage {

	public func noiseReductionFilter(noiseLevel: NSNumber = 0.02, sharpness: NSNumber = 0.4) -> CIImage? {
		guard let filter = CIFilter(name: "CINoiseReduction") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(noiseLevel, forKey: "inputNoiseLevel")
		filter.setValue(sharpness, forKey: "inputSharpness")
		return filter.outputImage
	}

}