import CoreImage 

public class GaussianGradient { 

	public var color1: CIColor = CIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
	public var color0: CIColor = CIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
	public var center: CIVector = CIVector(values: [150.0, 150.0], count: 2)
	public var radius: NSNumber = 300

	required public init(color1: CIColor = CIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0), color0: CIColor = CIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), center: CIVector = CIVector(values: [150.0, 150.0], count: 2), radius: NSNumber = 300){
		self.color1 = color1
		self.color0 = color0
		self.center = center
		self.radius = radius
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIGaussianGradient") else { return nil }
		filter.setValue(color1, forKey: "inputColor1")
		filter.setValue(color0, forKey: "inputColor0")
		filter.setValue(center, forKey: "inputCenter")
		filter.setValue(radius, forKey: "inputRadius")
		return filter
	}

}