import CoreImage 

public class ColorControls { 

	public var image: CIImage
	public var contrast: NSNumber = 1
	public var saturation: NSNumber = 1
	public var brightness: NSNumber = 0

	required public init(image: CIImage, contrast: NSNumber = 1, saturation: NSNumber = 1, brightness: NSNumber = 0){
		self.image = image
		self.contrast = contrast
		self.saturation = saturation
		self.brightness = brightness
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIColorControls") else { return nil }
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(contrast, forKey: "inputContrast")
		filter.setValue(saturation, forKey: "inputSaturation")
		filter.setValue(brightness, forKey: "inputBrightness")
		return filter
	}

}

extension CIImage {

	public func colorControlsFilter(contrast: NSNumber = 1, saturation: NSNumber = 1, brightness: NSNumber = 0) -> CIImage? {
		guard let filter = CIFilter(name: "CIColorControls") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(contrast, forKey: "inputContrast")
		filter.setValue(saturation, forKey: "inputSaturation")
		filter.setValue(brightness, forKey: "inputBrightness")
		return filter.outputImage
	}

}