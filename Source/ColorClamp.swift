import CoreImage 

public class ColorClamp { 

	public var image: CIImage
	public var minComponents: CIVector = CIVector(values: [0.0, 0.0, 0.0, 0.0], count: 4)
	public var maxComponents: CIVector = CIVector(values: [1.0, 1.0, 1.0, 1.0], count: 4)

	required public init(image: CIImage, minComponents: CIVector = CIVector(values: [0.0, 0.0, 0.0, 0.0], count: 4), maxComponents: CIVector = CIVector(values: [1.0, 1.0, 1.0, 1.0], count: 4)){
		self.image = image
		self.minComponents = minComponents
		self.maxComponents = maxComponents
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIColorClamp") else { return nil }
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(minComponents, forKey: "inputMinComponents")
		filter.setValue(maxComponents, forKey: "inputMaxComponents")
		return filter
	}

}

extension CIImage {

	public func colorClampFilter(minComponents: CIVector = CIVector(values: [0.0, 0.0, 0.0, 0.0], count: 4), maxComponents: CIVector = CIVector(values: [1.0, 1.0, 1.0, 1.0], count: 4)) -> CIImage? {
		guard let filter = CIFilter(name: "CIColorClamp") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(minComponents, forKey: "inputMinComponents")
		filter.setValue(maxComponents, forKey: "inputMaxComponents")
		return filter.outputImage
	}

}