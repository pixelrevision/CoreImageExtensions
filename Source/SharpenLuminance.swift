import CoreImage 

public class SharpenLuminance { 

	public var image: CIImage
	public var sharpness: NSNumber = 0.4

	required public init(image: CIImage, sharpness: NSNumber = 0.4){
		self.image = image
		self.sharpness = sharpness
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CISharpenLuminance") else { return nil }
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(sharpness, forKey: "inputSharpness")
		return filter
	}

}

extension CIImage {

	public func sharpenLuminanceFilter(sharpness: NSNumber = 0.4) -> CIImage? {
		guard let filter = CIFilter(name: "CISharpenLuminance") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(sharpness, forKey: "inputSharpness")
		return filter.outputImage
	}

}