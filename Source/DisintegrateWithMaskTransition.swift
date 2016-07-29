import CoreImage 

public class DisintegrateWithMaskTransition { 

	public var shadowOffset: CIVector = CIVector(values: [0.0, -10.0], count: 2)
	public var targetImage: CIImage
	public var shadowDensity: NSNumber = 0.65
	public var time: NSNumber = 0
	public var maskImage: CIImage
	public var image: CIImage
	public var shadowRadius: NSNumber = 8

	required public init(shadowOffset: CIVector = CIVector(values: [0.0, -10.0], count: 2), targetImage: CIImage, shadowDensity: NSNumber = 0.65, time: NSNumber = 0, maskImage: CIImage, image: CIImage, shadowRadius: NSNumber = 8){
		self.shadowOffset = shadowOffset
		self.targetImage = targetImage
		self.shadowDensity = shadowDensity
		self.time = time
		self.maskImage = maskImage
		self.image = image
		self.shadowRadius = shadowRadius
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIDisintegrateWithMaskTransition") else { return nil }
		filter.setValue(shadowOffset, forKey: "inputShadowOffset")
		filter.setValue(targetImage, forKey: "inputTargetImage")
		filter.setValue(shadowDensity, forKey: "inputShadowDensity")
		filter.setValue(time, forKey: "inputTime")
		filter.setValue(maskImage, forKey: "inputMaskImage")
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(shadowRadius, forKey: "inputShadowRadius")
		return filter
	}

}

extension CIImage {

	public func disintegrateWithMaskTransitionFilter(shadowOffset: CIVector = CIVector(values: [0.0, -10.0], count: 2), targetImage: CIImage, shadowDensity: NSNumber = 0.65, time: NSNumber = 0, maskImage: CIImage, shadowRadius: NSNumber = 8) -> CIImage? {
		guard let filter = CIFilter(name: "CIDisintegrateWithMaskTransition") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(shadowOffset, forKey: "inputShadowOffset")
		filter.setValue(targetImage, forKey: "inputTargetImage")
		filter.setValue(shadowDensity, forKey: "inputShadowDensity")
		filter.setValue(time, forKey: "inputTime")
		filter.setValue(maskImage, forKey: "inputMaskImage")
		filter.setValue(shadowRadius, forKey: "inputShadowRadius")
		return filter.outputImage
	}

}