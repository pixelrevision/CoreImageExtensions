import CoreImage 

public class ColorMap { 

	public var image: CIImage
	public var gradientImage: CIImage

	required public init(image: CIImage, gradientImage: CIImage){
		self.image = image
		self.gradientImage = gradientImage
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIColorMap") else { return nil }
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(gradientImage, forKey: "inputGradientImage")
		return filter
	}

}

extension CIImage {

	public func colorMapFilter(gradientImage: CIImage) -> CIImage? {
		guard let filter = CIFilter(name: "CIColorMap") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(gradientImage, forKey: "inputGradientImage")
		return filter.outputImage
	}

}