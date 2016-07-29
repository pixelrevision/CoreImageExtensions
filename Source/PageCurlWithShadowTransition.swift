import CoreImage 

public class PageCurlWithShadowTransition { 

	public var targetImage: CIImage
	public var angle: NSNumber = 0
	public var shadowSize: NSNumber = 0.5
	public var shadowExtent: CIVector = CIVector(values: [0.0, 0.0, 0.0, 0.0], count: 4)
	public var time: NSNumber = 0
	public var extent: CIVector = CIVector(values: [0.0, 0.0, 0.0, 0.0], count: 4)
	public var backsideImage: CIImage
	public var radius: NSNumber = 100
	public var shadowAmount: NSNumber = 0.7
	public var image: CIImage

	required public init(targetImage: CIImage, angle: NSNumber = 0, shadowSize: NSNumber = 0.5, shadowExtent: CIVector = CIVector(values: [0.0, 0.0, 0.0, 0.0], count: 4), time: NSNumber = 0, extent: CIVector = CIVector(values: [0.0, 0.0, 0.0, 0.0], count: 4), backsideImage: CIImage, radius: NSNumber = 100, shadowAmount: NSNumber = 0.7, image: CIImage){
		self.targetImage = targetImage
		self.angle = angle
		self.shadowSize = shadowSize
		self.shadowExtent = shadowExtent
		self.time = time
		self.extent = extent
		self.backsideImage = backsideImage
		self.radius = radius
		self.shadowAmount = shadowAmount
		self.image = image
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIPageCurlWithShadowTransition") else { return nil }
		filter.setValue(targetImage, forKey: "inputTargetImage")
		filter.setValue(angle, forKey: "inputAngle")
		filter.setValue(shadowSize, forKey: "inputShadowSize")
		filter.setValue(shadowExtent, forKey: "inputShadowExtent")
		filter.setValue(time, forKey: "inputTime")
		filter.setValue(extent, forKey: "inputExtent")
		filter.setValue(backsideImage, forKey: "inputBacksideImage")
		filter.setValue(radius, forKey: "inputRadius")
		filter.setValue(shadowAmount, forKey: "inputShadowAmount")
		filter.setValue(image, forKey: "inputImage")
		return filter
	}

}

extension CIImage {

	public func pageCurlWithShadowTransitionFilter(targetImage: CIImage, angle: NSNumber = 0, shadowSize: NSNumber = 0.5, shadowExtent: CIVector = CIVector(values: [0.0, 0.0, 0.0, 0.0], count: 4), time: NSNumber = 0, extent: CIVector = CIVector(values: [0.0, 0.0, 0.0, 0.0], count: 4), backsideImage: CIImage, radius: NSNumber = 100, shadowAmount: NSNumber = 0.7) -> CIImage? {
		guard let filter = CIFilter(name: "CIPageCurlWithShadowTransition") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(targetImage, forKey: "inputTargetImage")
		filter.setValue(angle, forKey: "inputAngle")
		filter.setValue(shadowSize, forKey: "inputShadowSize")
		filter.setValue(shadowExtent, forKey: "inputShadowExtent")
		filter.setValue(time, forKey: "inputTime")
		filter.setValue(extent, forKey: "inputExtent")
		filter.setValue(backsideImage, forKey: "inputBacksideImage")
		filter.setValue(radius, forKey: "inputRadius")
		filter.setValue(shadowAmount, forKey: "inputShadowAmount")
		return filter.outputImage
	}

}