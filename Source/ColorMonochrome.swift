import CoreImage 

public class ColorMonochrome { 

	public var intensity: NSNumber = 1
	public var image: CIImage
	public var color: CIColor = CIColor(red: 0.6, green: 0.45, blue: 0.3, alpha: 1.0)

	required public init(intensity: NSNumber = 1, image: CIImage, color: CIColor = CIColor(red: 0.6, green: 0.45, blue: 0.3, alpha: 1.0)){
		self.intensity = intensity
		self.image = image
		self.color = color
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIColorMonochrome") else { return nil }
		filter.setValue(intensity, forKey: "inputIntensity")
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(color, forKey: "inputColor")
		return filter
	}

}

extension CIImage {

	public func colorMonochromeFilter(intensity: NSNumber = 1, color: CIColor = CIColor(red: 0.6, green: 0.45, blue: 0.3, alpha: 1.0)) -> CIImage? {
		guard let filter = CIFilter(name: "CIColorMonochrome") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(intensity, forKey: "inputIntensity")
		filter.setValue(color, forKey: "inputColor")
		return filter.outputImage
	}

}