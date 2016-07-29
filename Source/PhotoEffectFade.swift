import CoreImage 

public class PhotoEffectFade { 

	public var image: CIImage

	required public init(image: CIImage){
		self.image = image
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIPhotoEffectFade") else { return nil }
		filter.setValue(image, forKey: "inputImage")
		return filter
	}

}

extension CIImage {

	public func photoEffectFadeFilter() -> CIImage? {
		guard let filter = CIFilter(name: "CIPhotoEffectFade") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		return filter.outputImage
	}

}