import CoreImage 

public class RadialGradient { 

	public var radius0: NSNumber = 5
	public var radius1: NSNumber = 100
	public var color0: CIColor = CIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
	public var color1: CIColor = CIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
	public var center: CIVector = CIVector(values: [150.0, 150.0], count: 2)

	required public init(radius0: NSNumber = 5, radius1: NSNumber = 100, color0: CIColor = CIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), color1: CIColor = CIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0), center: CIVector = CIVector(values: [150.0, 150.0], count: 2)){
		self.radius0 = radius0
		self.radius1 = radius1
		self.color0 = color0
		self.color1 = color1
		self.center = center
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIRadialGradient") else { return nil }
		filter.setValue(radius0, forKey: "inputRadius0")
		filter.setValue(radius1, forKey: "inputRadius1")
		filter.setValue(color0, forKey: "inputColor0")
		filter.setValue(color1, forKey: "inputColor1")
		filter.setValue(center, forKey: "inputCenter")
		return filter
	}

}