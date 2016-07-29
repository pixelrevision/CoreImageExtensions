import CoreImage 

public class CopyMachineTransition { 

	public var width: NSNumber = 200
	public var targetImage: CIImage
	public var angle: NSNumber = 0
	public var time: NSNumber = 0
	public var color: CIColor = CIColor(red: 0.6, green: 1.0, blue: 0.8, alpha: 1.0)
	public var extent: CIVector = CIVector(values: [0.0, 0.0, 300.0, 300.0], count: 4)
	public var image: CIImage
	public var opacity: NSNumber = 1.3

	required public init(width: NSNumber = 200, targetImage: CIImage, angle: NSNumber = 0, time: NSNumber = 0, color: CIColor = CIColor(red: 0.6, green: 1.0, blue: 0.8, alpha: 1.0), extent: CIVector = CIVector(values: [0.0, 0.0, 300.0, 300.0], count: 4), image: CIImage, opacity: NSNumber = 1.3){
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
		guard let filter = CIFilter(name: "CICopyMachineTransition") else { return nil }
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

	public func copyMachineTransitionFilter(width: NSNumber = 200, targetImage: CIImage, angle: NSNumber = 0, time: NSNumber = 0, color: CIColor = CIColor(red: 0.6, green: 1.0, blue: 0.8, alpha: 1.0), extent: CIVector = CIVector(values: [0.0, 0.0, 300.0, 300.0], count: 4), opacity: NSNumber = 1.3) -> CIImage? {
		guard let filter = CIFilter(name: "CICopyMachineTransition") else { return nil }
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