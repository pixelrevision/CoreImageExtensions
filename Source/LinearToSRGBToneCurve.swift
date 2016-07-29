import CoreImage 

public class LinearToSRGBToneCurve { 

	public var image: CIImage

	required public init(image: CIImage){
		self.image = image
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CILinearToSRGBToneCurve") else { return nil }
		filter.setValue(image, forKey: "inputImage")
		return filter
	}

}

extension CIImage {

	public func linearToSRGBToneCurveFilter() -> CIImage? {
		guard let filter = CIFilter(name: "CILinearToSRGBToneCurve") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		return filter.outputImage
	}

}