import CoreImage 

public class AreaMinimum { 

	public var image: CIImage
	public var extent: CIVector = CIVector(values: [0.0, 0.0, 640.0, 80.0], count: 4)

	required public init(image: CIImage, extent: CIVector = CIVector(values: [0.0, 0.0, 640.0, 80.0], count: 4)){
		self.image = image
		self.extent = extent
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIAreaMinimum") else { return nil }
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(extent, forKey: "inputExtent")
		return filter
	}

}

extension CIImage {

	public func areaMinimumFilter(extent: CIVector = CIVector(values: [0.0, 0.0, 640.0, 80.0], count: 4)) -> CIImage? {
		guard let filter = CIFilter(name: "CIAreaMinimum") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(extent, forKey: "inputExtent")
		return filter.outputImage
	}

}