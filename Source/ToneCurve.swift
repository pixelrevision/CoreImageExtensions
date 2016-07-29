import CoreImage 

public class ToneCurve { 

	public var point1: CIVector = CIVector(values: [0.25, 0.25], count: 2)
	public var image: CIImage
	public var point3: CIVector = CIVector(values: [0.75, 0.75], count: 2)
	public var point2: CIVector = CIVector(values: [0.5, 0.5], count: 2)
	public var point0: CIVector = CIVector(values: [0.0, 0.0], count: 2)
	public var point4: CIVector = CIVector(values: [1.0, 1.0], count: 2)

	required public init(point1: CIVector = CIVector(values: [0.25, 0.25], count: 2), image: CIImage, point3: CIVector = CIVector(values: [0.75, 0.75], count: 2), point2: CIVector = CIVector(values: [0.5, 0.5], count: 2), point0: CIVector = CIVector(values: [0.0, 0.0], count: 2), point4: CIVector = CIVector(values: [1.0, 1.0], count: 2)){
		self.point1 = point1
		self.image = image
		self.point3 = point3
		self.point2 = point2
		self.point0 = point0
		self.point4 = point4
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIToneCurve") else { return nil }
		filter.setValue(point1, forKey: "inputPoint1")
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(point3, forKey: "inputPoint3")
		filter.setValue(point2, forKey: "inputPoint2")
		filter.setValue(point0, forKey: "inputPoint0")
		filter.setValue(point4, forKey: "inputPoint4")
		return filter
	}

}

extension CIImage {

	public func toneCurveFilter(point1: CIVector = CIVector(values: [0.25, 0.25], count: 2), point3: CIVector = CIVector(values: [0.75, 0.75], count: 2), point2: CIVector = CIVector(values: [0.5, 0.5], count: 2), point0: CIVector = CIVector(values: [0.0, 0.0], count: 2), point4: CIVector = CIVector(values: [1.0, 1.0], count: 2)) -> CIImage? {
		guard let filter = CIFilter(name: "CIToneCurve") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(point1, forKey: "inputPoint1")
		filter.setValue(point3, forKey: "inputPoint3")
		filter.setValue(point2, forKey: "inputPoint2")
		filter.setValue(point0, forKey: "inputPoint0")
		filter.setValue(point4, forKey: "inputPoint4")
		return filter.outputImage
	}

}