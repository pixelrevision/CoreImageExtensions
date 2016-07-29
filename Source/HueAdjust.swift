import CoreImage 

public class HueAdjust { 

	public var image: CIImage
	public var angle: NSNumber = 0

	required public init(image: CIImage, angle: NSNumber = 0){
		self.image = image
		self.angle = angle
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIHueAdjust") else { return nil }
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(angle, forKey: "inputAngle")
		return filter
	}

}

extension CIImage {

	public func hueAdjustFilter(angle: NSNumber = 0) -> CIImage? {
		guard let filter = CIFilter(name: "CIHueAdjust") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(angle, forKey: "inputAngle")
		return filter.outputImage
	}

}