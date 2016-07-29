import CoreImage 

public class PerspectiveCorrection { 

	public var topRight: CIVector = CIVector(values: [646.0, 507.0], count: 2)
	public var image: CIImage
	public var bottomLeft: CIVector = CIVector(values: [155.0, 153.0], count: 2)
	public var topLeft: CIVector = CIVector(values: [118.0, 484.0], count: 2)
	public var bottomRight: CIVector = CIVector(values: [548.0, 140.0], count: 2)

	required public init(topRight: CIVector = CIVector(values: [646.0, 507.0], count: 2), image: CIImage, bottomLeft: CIVector = CIVector(values: [155.0, 153.0], count: 2), topLeft: CIVector = CIVector(values: [118.0, 484.0], count: 2), bottomRight: CIVector = CIVector(values: [548.0, 140.0], count: 2)){
		self.topRight = topRight
		self.image = image
		self.bottomLeft = bottomLeft
		self.topLeft = topLeft
		self.bottomRight = bottomRight
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIPerspectiveCorrection") else { return nil }
		filter.setValue(topRight, forKey: "inputTopRight")
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(bottomLeft, forKey: "inputBottomLeft")
		filter.setValue(topLeft, forKey: "inputTopLeft")
		filter.setValue(bottomRight, forKey: "inputBottomRight")
		return filter
	}

}

extension CIImage {

	public func perspectiveCorrectionFilter(topRight: CIVector = CIVector(values: [646.0, 507.0], count: 2), bottomLeft: CIVector = CIVector(values: [155.0, 153.0], count: 2), topLeft: CIVector = CIVector(values: [118.0, 484.0], count: 2), bottomRight: CIVector = CIVector(values: [548.0, 140.0], count: 2)) -> CIImage? {
		guard let filter = CIFilter(name: "CIPerspectiveCorrection") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(topRight, forKey: "inputTopRight")
		filter.setValue(bottomLeft, forKey: "inputBottomLeft")
		filter.setValue(topLeft, forKey: "inputTopLeft")
		filter.setValue(bottomRight, forKey: "inputBottomRight")
		return filter.outputImage
	}

}