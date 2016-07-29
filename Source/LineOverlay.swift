import CoreImage 

public class LineOverlay { 

	public var nRNoiseLevel: NSNumber = 0.07000000000000001
	public var contrast: NSNumber = 50
	public var threshold: NSNumber = 0.1
	public var nRSharpness: NSNumber = 0.71
	public var image: CIImage
	public var edgeIntensity: NSNumber = 1

	required public init(nRNoiseLevel: NSNumber = 0.07000000000000001, contrast: NSNumber = 50, threshold: NSNumber = 0.1, nRSharpness: NSNumber = 0.71, image: CIImage, edgeIntensity: NSNumber = 1){
		self.nRNoiseLevel = nRNoiseLevel
		self.contrast = contrast
		self.threshold = threshold
		self.nRSharpness = nRSharpness
		self.image = image
		self.edgeIntensity = edgeIntensity
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CILineOverlay") else { return nil }
		filter.setValue(nRNoiseLevel, forKey: "inputNRNoiseLevel")
		filter.setValue(contrast, forKey: "inputContrast")
		filter.setValue(threshold, forKey: "inputThreshold")
		filter.setValue(nRSharpness, forKey: "inputNRSharpness")
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(edgeIntensity, forKey: "inputEdgeIntensity")
		return filter
	}

}

extension CIImage {

	public func lineOverlayFilter(nRNoiseLevel: NSNumber = 0.07000000000000001, contrast: NSNumber = 50, threshold: NSNumber = 0.1, nRSharpness: NSNumber = 0.71, edgeIntensity: NSNumber = 1) -> CIImage? {
		guard let filter = CIFilter(name: "CILineOverlay") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(nRNoiseLevel, forKey: "inputNRNoiseLevel")
		filter.setValue(contrast, forKey: "inputContrast")
		filter.setValue(threshold, forKey: "inputThreshold")
		filter.setValue(nRSharpness, forKey: "inputNRSharpness")
		filter.setValue(edgeIntensity, forKey: "inputEdgeIntensity")
		return filter.outputImage
	}

}