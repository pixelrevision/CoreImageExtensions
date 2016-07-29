import CoreImage 

public class MaskedVariableBlur { 

	public var image: CIImage
	public var mask: CIImage
	public var radius: NSNumber = 5

	required public init(image: CIImage, mask: CIImage, radius: NSNumber = 5){
		self.image = image
		self.mask = mask
		self.radius = radius
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIMaskedVariableBlur") else { return nil }
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(mask, forKey: "inputMask")
		filter.setValue(radius, forKey: "inputRadius")
		return filter
	}

}

extension CIImage {

	public func maskedVariableBlurFilter(mask: CIImage, radius: NSNumber = 5) -> CIImage? {
		guard let filter = CIFilter(name: "CIMaskedVariableBlur") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(mask, forKey: "inputMask")
		filter.setValue(radius, forKey: "inputRadius")
		return filter.outputImage
	}

}