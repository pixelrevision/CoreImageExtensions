import CoreImage 

public class LinearGradient { 

	public var point1: CIVector = CIVector(values: [200.0, 200.0], count: 2)
	public var color1: CIColor = CIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
	public var color0: CIColor = CIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
	public var point0: CIVector = CIVector(values: [0.0, 0.0], count: 2)

	required public init(point1: CIVector = CIVector(values: [200.0, 200.0], count: 2), color1: CIColor = CIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0), color0: CIColor = CIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), point0: CIVector = CIVector(values: [0.0, 0.0], count: 2)){
		self.point1 = point1
		self.color1 = color1
		self.color0 = color0
		self.point0 = point0
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CILinearGradient") else { return nil }
		filter.setValue(point1, forKey: "inputPoint1")
		filter.setValue(color1, forKey: "inputColor1")
		filter.setValue(color0, forKey: "inputColor0")
		filter.setValue(point0, forKey: "inputPoint0")
		return filter
	}

}