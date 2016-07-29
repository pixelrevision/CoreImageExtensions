import CoreImage 

public class SwipeTransition { 

	public var width: NSNumber = 300
	public var targetImage: CIImage
	public var angle: NSNumber = 0
	public var time: NSNumber = 0
	public var color: CIColor = CIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
	public var extent: CIVector = CIVector(values: [0.0, 0.0, 300.0, 300.0], count: 4)
	public var image: CIImage
	public var opacity: NSNumber = 0

	required public init(width: NSNumber = 300, targetImage: CIImage, angle: NSNumber = 0, time: NSNumber = 0, color: CIColor = CIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), extent: CIVector = CIVector(values: [0.0, 0.0, 300.0, 300.0], count: 4), image: CIImage, opacity: NSNumber = 0){
		self.width = width
		self.targetImage = targetImage
		self.angle = angle
		self.time = time
		self.color = color
		self.extent = extent
		self.image = image
		self.opacity = opacity
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CISwipeTransition") else { return nil }
		filter.setValue(width, forKey: "inputWidth")
		filter.setValue(targetImage, forKey: "inputTargetImage")
		filter.setValue(angle, forKey: "inputAngle")
		filter.setValue(time, forKey: "inputTime")
		filter.setValue(color, forKey: "inputColor")
		filter.setValue(extent, forKey: "inputExtent")
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(opacity, forKey: "inputOpacity")
		return filter
	}

}

extension CIImage {

	public func swipeTransitionFilter(width: NSNumber = 300, targetImage: CIImage, angle: NSNumber = 0, time: NSNumber = 0, color: CIColor = CIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), extent: CIVector = CIVector(values: [0.0, 0.0, 300.0, 300.0], count: 4), opacity: NSNumber = 0) -> CIImage? {
		guard let filter = CIFilter(name: "CISwipeTransition") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(width, forKey: "inputWidth")
		filter.setValue(targetImage, forKey: "inputTargetImage")
		filter.setValue(angle, forKey: "inputAngle")
		filter.setValue(time, forKey: "inputTime")
		filter.setValue(color, forKey: "inputColor")
		filter.setValue(extent, forKey: "inputExtent")
		filter.setValue(opacity, forKey: "inputOpacity")
		return filter.outputImage
	}

}