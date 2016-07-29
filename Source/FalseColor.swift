import CoreImage 

public class FalseColor { 

	public var image: CIImage
	public var color0: CIColor = CIColor(red: 0.3, green: 0.0, blue: 0.0, alpha: 1.0)
	public var color1: CIColor = CIColor(red: 1.0, green: 0.9, blue: 0.8, alpha: 1.0)

	required public init(image: CIImage, color0: CIColor = CIColor(red: 0.3, green: 0.0, blue: 0.0, alpha: 1.0), color1: CIColor = CIColor(red: 1.0, green: 0.9, blue: 0.8, alpha: 1.0)){
		self.image = image
		self.color0 = color0
		self.color1 = color1
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIFalseColor") else { return nil }
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(color0, forKey: "inputColor0")
		filter.setValue(color1, forKey: "inputColor1")
		return filter
	}

}

extension CIImage {

	public func falseColorFilter(color0: CIColor = CIColor(red: 0.3, green: 0.0, blue: 0.0, alpha: 1.0), color1: CIColor = CIColor(red: 1.0, green: 0.9, blue: 0.8, alpha: 1.0)) -> CIImage? {
		guard let filter = CIFilter(name: "CIFalseColor") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(color0, forKey: "inputColor0")
		filter.setValue(color1, forKey: "inputColor1")
		return filter.outputImage
	}

}