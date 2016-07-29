import CoreImage 

public class RippleTransition { 

	public var width: NSNumber = 100
	public var targetImage: CIImage
	public var center: CIVector = CIVector(values: [150.0, 150.0], count: 2)
	public var scale: NSNumber = 50
	public var time: NSNumber = 0
	public var extent: CIVector = CIVector(values: [0.0, 0.0, 300.0, 300.0], count: 4)
	public var image: CIImage
	public var shadingImage: CIImage

	required public init(width: NSNumber = 100, targetImage: CIImage, center: CIVector = CIVector(values: [150.0, 150.0], count: 2), scale: NSNumber = 50, time: NSNumber = 0, extent: CIVector = CIVector(values: [0.0, 0.0, 300.0, 300.0], count: 4), image: CIImage, shadingImage: CIImage){
		self.width = width
		self.targetImage = targetImage
		self.center = center
		self.scale = scale
		self.time = time
		self.extent = extent
		self.image = image
		self.shadingImage = shadingImage
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIRippleTransition") else { return nil }
		filter.setValue(width, forKey: "inputWidth")
		filter.setValue(targetImage, forKey: "inputTargetImage")
		filter.setValue(center, forKey: "inputCenter")
		filter.setValue(scale, forKey: "inputScale")
		filter.setValue(time, forKey: "inputTime")
		filter.setValue(extent, forKey: "inputExtent")
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(shadingImage, forKey: "inputShadingImage")
		return filter
	}

}

extension CIImage {

	public func rippleTransitionFilter(width: NSNumber = 100, targetImage: CIImage, center: CIVector = CIVector(values: [150.0, 150.0], count: 2), scale: NSNumber = 50, time: NSNumber = 0, extent: CIVector = CIVector(values: [0.0, 0.0, 300.0, 300.0], count: 4), shadingImage: CIImage) -> CIImage? {
		guard let filter = CIFilter(name: "CIRippleTransition") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(width, forKey: "inputWidth")
		filter.setValue(targetImage, forKey: "inputTargetImage")
		filter.setValue(center, forKey: "inputCenter")
		filter.setValue(scale, forKey: "inputScale")
		filter.setValue(time, forKey: "inputTime")
		filter.setValue(extent, forKey: "inputExtent")
		filter.setValue(shadingImage, forKey: "inputShadingImage")
		return filter.outputImage
	}

}