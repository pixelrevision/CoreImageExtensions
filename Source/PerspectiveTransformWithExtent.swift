import CoreImage 

public class PerspectiveTransformWithExtent { 

	public var topRight: CIVector = CIVector(values: [646.0, 507.0], count: 2)
	public var image: CIImage
	public var bottomRight: CIVector = CIVector(values: [548.0, 140.0], count: 2)
	public var topLeft: CIVector = CIVector(values: [118.0, 484.0], count: 2)
	public var bottomLeft: CIVector = CIVector(values: [155.0, 153.0], count: 2)
	public var extent: CIVector = CIVector(values: [0.0, 0.0, 300.0, 300.0], count: 4)

	required public init(topRight: CIVector = CIVector(values: [646.0, 507.0], count: 2), image: CIImage, bottomRight: CIVector = CIVector(values: [548.0, 140.0], count: 2), topLeft: CIVector = CIVector(values: [118.0, 484.0], count: 2), bottomLeft: CIVector = CIVector(values: [155.0, 153.0], count: 2), extent: CIVector = CIVector(values: [0.0, 0.0, 300.0, 300.0], count: 4)){
		self.topRight = topRight
		self.image = image
		self.bottomRight = bottomRight
		self.topLeft = topLeft
		self.bottomLeft = bottomLeft
		self.extent = extent
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIPerspectiveTransformWithExtent") else { return nil }
		filter.setValue(topRight, forKey: "inputTopRight")
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(bottomRight, forKey: "inputBottomRight")
		filter.setValue(topLeft, forKey: "inputTopLeft")
		filter.setValue(bottomLeft, forKey: "inputBottomLeft")
		filter.setValue(extent, forKey: "inputExtent")
		return filter
	}

}

extension CIImage {

	public func perspectiveTransformWithExtentFilter(topRight: CIVector = CIVector(values: [646.0, 507.0], count: 2), bottomRight: CIVector = CIVector(values: [548.0, 140.0], count: 2), topLeft: CIVector = CIVector(values: [118.0, 484.0], count: 2), bottomLeft: CIVector = CIVector(values: [155.0, 153.0], count: 2), extent: CIVector = CIVector(values: [0.0, 0.0, 300.0, 300.0], count: 4)) -> CIImage? {
		guard let filter = CIFilter(name: "CIPerspectiveTransformWithExtent") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(topRight, forKey: "inputTopRight")
		filter.setValue(bottomRight, forKey: "inputBottomRight")
		filter.setValue(topLeft, forKey: "inputTopLeft")
		filter.setValue(bottomLeft, forKey: "inputBottomLeft")
		filter.setValue(extent, forKey: "inputExtent")
		return filter.outputImage
	}

}