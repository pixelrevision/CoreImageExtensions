import CoreImage 

public class HexagonalPixellate { 

	public var image: CIImage
	public var center: CIVector = CIVector(values: [150.0, 150.0], count: 2)
	public var scale: NSNumber = 8

	required public init(image: CIImage, center: CIVector = CIVector(values: [150.0, 150.0], count: 2), scale: NSNumber = 8){
		self.image = image
		self.center = center
		self.scale = scale
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIHexagonalPixellate") else { return nil }
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(center, forKey: "inputCenter")
		filter.setValue(scale, forKey: "inputScale")
		return filter
	}

}

extension CIImage {

	public func hexagonalPixellateFilter(center: CIVector = CIVector(values: [150.0, 150.0], count: 2), scale: NSNumber = 8) -> CIImage? {
		guard let filter = CIFilter(name: "CIHexagonalPixellate") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(center, forKey: "inputCenter")
		filter.setValue(scale, forKey: "inputScale")
		return filter.outputImage
	}

}