import CoreImage 

public class TemperatureAndTint { 

	public var neutral: CIVector = CIVector(values: [6500.0, 0.0], count: 2)
	public var image: CIImage
	public var targetNeutral: CIVector = CIVector(values: [6500.0, 0.0], count: 2)

	required public init(neutral: CIVector = CIVector(values: [6500.0, 0.0], count: 2), image: CIImage, targetNeutral: CIVector = CIVector(values: [6500.0, 0.0], count: 2)){
		self.neutral = neutral
		self.image = image
		self.targetNeutral = targetNeutral
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CITemperatureAndTint") else { return nil }
		filter.setValue(neutral, forKey: "inputNeutral")
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(targetNeutral, forKey: "inputTargetNeutral")
		return filter
	}

}

extension CIImage {

	public func temperatureAndTintFilter(neutral: CIVector = CIVector(values: [6500.0, 0.0], count: 2), targetNeutral: CIVector = CIVector(values: [6500.0, 0.0], count: 2)) -> CIImage? {
		guard let filter = CIFilter(name: "CITemperatureAndTint") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(neutral, forKey: "inputNeutral")
		filter.setValue(targetNeutral, forKey: "inputTargetNeutral")
		return filter.outputImage
	}

}