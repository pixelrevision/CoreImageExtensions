import CoreImage 

public class SpotLight { 

	public var lightPosition: CIVector = CIVector(values: [400.0, 600.0, 150.0], count: 3)
	public var image: CIImage
	public var lightPointsAt: CIVector = CIVector(values: [200.0, 200.0, 0.0], count: 3)
	public var concentration: NSNumber = 0.1
	public var brightness: NSNumber = 3
	public var color: CIColor = CIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

	required public init(lightPosition: CIVector = CIVector(values: [400.0, 600.0, 150.0], count: 3), image: CIImage, lightPointsAt: CIVector = CIVector(values: [200.0, 200.0, 0.0], count: 3), concentration: NSNumber = 0.1, brightness: NSNumber = 3, color: CIColor = CIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)){
		self.lightPosition = lightPosition
		self.image = image
		self.lightPointsAt = lightPointsAt
		self.concentration = concentration
		self.brightness = brightness
		self.color = color
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CISpotLight") else { return nil }
		filter.setValue(lightPosition, forKey: "inputLightPosition")
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(lightPointsAt, forKey: "inputLightPointsAt")
		filter.setValue(concentration, forKey: "inputConcentration")
		filter.setValue(brightness, forKey: "inputBrightness")
		filter.setValue(color, forKey: "inputColor")
		return filter
	}

}

extension CIImage {

	public func spotLightFilter(lightPosition: CIVector = CIVector(values: [400.0, 600.0, 150.0], count: 3), lightPointsAt: CIVector = CIVector(values: [200.0, 200.0, 0.0], count: 3), concentration: NSNumber = 0.1, brightness: NSNumber = 3, color: CIColor = CIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)) -> CIImage? {
		guard let filter = CIFilter(name: "CISpotLight") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(lightPosition, forKey: "inputLightPosition")
		filter.setValue(lightPointsAt, forKey: "inputLightPointsAt")
		filter.setValue(concentration, forKey: "inputConcentration")
		filter.setValue(brightness, forKey: "inputBrightness")
		filter.setValue(color, forKey: "inputColor")
		return filter.outputImage
	}

}