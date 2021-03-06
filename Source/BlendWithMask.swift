import CoreImage 

public class BlendWithMask { 

	public var image: CIImage
	public var maskImage: CIImage
	public var backgroundImage: CIImage

	required public init(image: CIImage, maskImage: CIImage, backgroundImage: CIImage){
		self.image = image
		self.maskImage = maskImage
		self.backgroundImage = backgroundImage
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIBlendWithMask") else { return nil }
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(maskImage, forKey: "inputMaskImage")
		filter.setValue(backgroundImage, forKey: "inputBackgroundImage")
		return filter
	}

}

extension CIImage {

	public func blendWithMaskFilter(maskImage: CIImage, backgroundImage: CIImage) -> CIImage? {
		guard let filter = CIFilter(name: "CIBlendWithMask") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(maskImage, forKey: "inputMaskImage")
		filter.setValue(backgroundImage, forKey: "inputBackgroundImage")
		return filter.outputImage
	}

}