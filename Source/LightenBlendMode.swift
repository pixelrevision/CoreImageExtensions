import CoreImage 

public class LightenBlendMode { 

	public var image: CIImage
	public var backgroundImage: CIImage

	required public init(image: CIImage, backgroundImage: CIImage){
		self.image = image
		self.backgroundImage = backgroundImage
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CILightenBlendMode") else { return nil }
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(backgroundImage, forKey: "inputBackgroundImage")
		return filter
	}

}

extension CIImage {

	public func lightenBlendModeFilter(backgroundImage: CIImage) -> CIImage? {
		guard let filter = CIFilter(name: "CILightenBlendMode") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(backgroundImage, forKey: "inputBackgroundImage")
		return filter.outputImage
	}

}