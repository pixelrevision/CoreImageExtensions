import CoreImage 

public class ShadedMaterial { 

	public var image: CIImage
	public var shadingImage: CIImage
	public var scale: NSNumber = 10

	required public init(image: CIImage, shadingImage: CIImage, scale: NSNumber = 10){
		self.image = image
		self.shadingImage = shadingImage
		self.scale = scale
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIShadedMaterial") else { return nil }
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(shadingImage, forKey: "inputShadingImage")
		filter.setValue(scale, forKey: "inputScale")
		return filter
	}

}

extension CIImage {

	public func shadedMaterialFilter(shadingImage: CIImage, scale: NSNumber = 10) -> CIImage? {
		guard let filter = CIFilter(name: "CIShadedMaterial") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(shadingImage, forKey: "inputShadingImage")
		filter.setValue(scale, forKey: "inputScale")
		return filter.outputImage
	}

}