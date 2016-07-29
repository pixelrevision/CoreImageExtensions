import CoreImage 

public class StraightenFilter { 

	public var image: CIImage
	public var angle: NSNumber = 0

	required public init(image: CIImage, angle: NSNumber = 0){
		self.image = image
		self.angle = angle
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIStraightenFilter") else { return nil }
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(angle, forKey: "inputAngle")
		return filter
	}

}

extension CIImage {

	public func straightenFilterFilter(angle: NSNumber = 0) -> CIImage? {
		guard let filter = CIFilter(name: "CIStraightenFilter") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(angle, forKey: "inputAngle")
		return filter.outputImage
	}

}