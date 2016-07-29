import CoreImage 

public class SunbeamsGenerator { 

	public var sunRadius: NSNumber = 40
	public var striationStrength: NSNumber = 0.5
	public var center: CIVector = CIVector(values: [150.0, 150.0], count: 2)
	public var maxStriationRadius: NSNumber = 2.58
	public var time: NSNumber = 0
	public var color: CIColor = CIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0)
	public var striationContrast: NSNumber = 1.375

	required public init(sunRadius: NSNumber = 40, striationStrength: NSNumber = 0.5, center: CIVector = CIVector(values: [150.0, 150.0], count: 2), maxStriationRadius: NSNumber = 2.58, time: NSNumber = 0, color: CIColor = CIColor(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0), striationContrast: NSNumber = 1.375){
		self.sunRadius = sunRadius
		self.striationStrength = striationStrength
		self.center = center
		self.maxStriationRadius = maxStriationRadius
		self.time = time
		self.color = color
		self.striationContrast = striationContrast
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CISunbeamsGenerator") else { return nil }
		filter.setValue(sunRadius, forKey: "inputSunRadius")
		filter.setValue(striationStrength, forKey: "inputStriationStrength")
		filter.setValue(center, forKey: "inputCenter")
		filter.setValue(maxStriationRadius, forKey: "inputMaxStriationRadius")
		filter.setValue(time, forKey: "inputTime")
		filter.setValue(color, forKey: "inputColor")
		filter.setValue(striationContrast, forKey: "inputStriationContrast")
		return filter
	}

}