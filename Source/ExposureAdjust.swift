import CoreImage 

public class ExposureAdjust { 

	public var eV: NSNumber = 0
	public var image: CIImage

	required public init(eV: NSNumber = 0, image: CIImage){
		self.eV = eV
		self.image = image
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIExposureAdjust") else { return nil }
		filter.setValue(eV, forKey: "inputEV")
		filter.setValue(image, forKey: "inputImage")
		return filter
	}

}

extension CIImage {

	public func exposureAdjustFilter(eV: NSNumber = 0) -> CIImage? {
		guard let filter = CIFilter(name: "CIExposureAdjust") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(eV, forKey: "inputEV")
		return filter.outputImage
	}

}