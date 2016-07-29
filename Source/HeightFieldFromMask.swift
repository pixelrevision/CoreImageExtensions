import CoreImage 

public class HeightFieldFromMask { 

	public var image: CIImage
	public var radius: NSNumber = 10

	required public init(image: CIImage, radius: NSNumber = 10){
		self.image = image
		self.radius = radius
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIHeightFieldFromMask") else { return nil }
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(radius, forKey: "inputRadius")
		return filter
	}

}

extension CIImage {

	public func heightFieldFromMaskFilter(radius: NSNumber = 10) -> CIImage? {
		guard let filter = CIFilter(name: "CIHeightFieldFromMask") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(radius, forKey: "inputRadius")
		return filter.outputImage
	}

}