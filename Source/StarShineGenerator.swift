import CoreImage 

public class StarShineGenerator { 

	public var center: CIVector = CIVector(values: [150.0, 150.0], count: 2)
	public var epsilon: NSNumber = -2
	public var radius: NSNumber = 50
	public var color: CIColor = CIColor(red: 1.0, green: 0.8, blue: 0.6, alpha: 1.0)
	public var crossScale: NSNumber = 15
	public var crossWidth: NSNumber = 2.5
	public var crossAngle: NSNumber = 0.6
	public var crossOpacity: NSNumber = -2

	required public init(center: CIVector = CIVector(values: [150.0, 150.0], count: 2), epsilon: NSNumber = -2, radius: NSNumber = 50, color: CIColor = CIColor(red: 1.0, green: 0.8, blue: 0.6, alpha: 1.0), crossScale: NSNumber = 15, crossWidth: NSNumber = 2.5, crossAngle: NSNumber = 0.6, crossOpacity: NSNumber = -2){
		self.center = center
		self.epsilon = epsilon
		self.radius = radius
		self.color = color
		self.crossScale = crossScale
		self.crossWidth = crossWidth
		self.crossAngle = crossAngle
		self.crossOpacity = crossOpacity
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIStarShineGenerator") else { return nil }
		filter.setValue(center, forKey: "inputCenter")
		filter.setValue(epsilon, forKey: "inputEpsilon")
		filter.setValue(radius, forKey: "inputRadius")
		filter.setValue(color, forKey: "inputColor")
		filter.setValue(crossScale, forKey: "inputCrossScale")
		filter.setValue(crossWidth, forKey: "inputCrossWidth")
		filter.setValue(crossAngle, forKey: "inputCrossAngle")
		filter.setValue(crossOpacity, forKey: "inputCrossOpacity")
		return filter
	}

}