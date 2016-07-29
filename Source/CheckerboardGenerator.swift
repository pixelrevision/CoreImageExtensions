import CoreImage 

public class CheckerboardGenerator { 

	public var width: NSNumber = 80
	public var color1: CIColor = CIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
	public var color0: CIColor = CIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
	public var sharpness: NSNumber = 1
	public var center: CIVector = CIVector(values: [150.0, 150.0], count: 2)

	required public init(width: NSNumber = 80, color1: CIColor = CIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0), color0: CIColor = CIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), sharpness: NSNumber = 1, center: CIVector = CIVector(values: [150.0, 150.0], count: 2)){
		self.width = width
		self.color1 = color1
		self.color0 = color0
		self.sharpness = sharpness
		self.center = center
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CICheckerboardGenerator") else { return nil }
		filter.setValue(width, forKey: "inputWidth")
		filter.setValue(color1, forKey: "inputColor1")
		filter.setValue(color0, forKey: "inputColor0")
		filter.setValue(sharpness, forKey: "inputSharpness")
		filter.setValue(center, forKey: "inputCenter")
		return filter
	}

}