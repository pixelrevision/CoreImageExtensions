import CoreImage 

public class FlashTransition { 

	public var targetImage: CIImage
	public var striationStrength: NSNumber = 0.5
	public var center: CIVector = CIVector(values: [150.0, 150.0], count: 2)
	public var maxStriationRadius: NSNumber = 2.58
	public var time: NSNumber = 0
	public var color: CIColor = CIColor(red: 1.0, green: 0.8, blue: 0.6, alpha: 1.0)
	public var extent: CIVector = CIVector(values: [0.0, 0.0, 300.0, 300.0], count: 4)
	public var striationContrast: NSNumber = 1.375
	public var image: CIImage
	public var fadeThreshold: NSNumber = 0.85

	required public init(targetImage: CIImage, striationStrength: NSNumber = 0.5, center: CIVector = CIVector(values: [150.0, 150.0], count: 2), maxStriationRadius: NSNumber = 2.58, time: NSNumber = 0, color: CIColor = CIColor(red: 1.0, green: 0.8, blue: 0.6, alpha: 1.0), extent: CIVector = CIVector(values: [0.0, 0.0, 300.0, 300.0], count: 4), striationContrast: NSNumber = 1.375, image: CIImage, fadeThreshold: NSNumber = 0.85){
		self.targetImage = targetImage
		self.striationStrength = striationStrength
		self.center = center
		self.maxStriationRadius = maxStriationRadius
		self.time = time
		self.color = color
		self.extent = extent
		self.striationContrast = striationContrast
		self.image = image
		self.fadeThreshold = fadeThreshold
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIFlashTransition") else { return nil }
		filter.setValue(targetImage, forKey: "inputTargetImage")
		filter.setValue(striationStrength, forKey: "inputStriationStrength")
		filter.setValue(center, forKey: "inputCenter")
		filter.setValue(maxStriationRadius, forKey: "inputMaxStriationRadius")
		filter.setValue(time, forKey: "inputTime")
		filter.setValue(color, forKey: "inputColor")
		filter.setValue(extent, forKey: "inputExtent")
		filter.setValue(striationContrast, forKey: "inputStriationContrast")
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(fadeThreshold, forKey: "inputFadeThreshold")
		return filter
	}

}

extension CIImage {

	public func flashTransitionFilter(targetImage: CIImage, striationStrength: NSNumber = 0.5, center: CIVector = CIVector(values: [150.0, 150.0], count: 2), maxStriationRadius: NSNumber = 2.58, time: NSNumber = 0, color: CIColor = CIColor(red: 1.0, green: 0.8, blue: 0.6, alpha: 1.0), extent: CIVector = CIVector(values: [0.0, 0.0, 300.0, 300.0], count: 4), striationContrast: NSNumber = 1.375, fadeThreshold: NSNumber = 0.85) -> CIImage? {
		guard let filter = CIFilter(name: "CIFlashTransition") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(targetImage, forKey: "inputTargetImage")
		filter.setValue(striationStrength, forKey: "inputStriationStrength")
		filter.setValue(center, forKey: "inputCenter")
		filter.setValue(maxStriationRadius, forKey: "inputMaxStriationRadius")
		filter.setValue(time, forKey: "inputTime")
		filter.setValue(color, forKey: "inputColor")
		filter.setValue(extent, forKey: "inputExtent")
		filter.setValue(striationContrast, forKey: "inputStriationContrast")
		filter.setValue(fadeThreshold, forKey: "inputFadeThreshold")
		return filter.outputImage
	}

}