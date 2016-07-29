import CoreImage 

public class ColorPosterize { 

	public var image: CIImage
	public var levels: NSNumber = 6

	required public init(image: CIImage, levels: NSNumber = 6){
		self.image = image
		self.levels = levels
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIColorPosterize") else { return nil }
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(levels, forKey: "inputLevels")
		return filter
	}

}

extension CIImage {

	public func colorPosterizeFilter(levels: NSNumber = 6) -> CIImage? {
		guard let filter = CIFilter(name: "CIColorPosterize") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(levels, forKey: "inputLevels")
		return filter.outputImage
	}

}