import CoreImage 

public class LenticularHaloGenerator { 

	public var haloOverlap: NSNumber = 0.77
	public var striationStrength: NSNumber = 0.5
	public var center: CIVector = CIVector(values: [150.0, 150.0], count: 2)
	public var time: NSNumber = 0
	public var color: CIColor = CIColor(red: 1.0, green: 0.9, blue: 0.8, alpha: 1.0)
	public var striationContrast: NSNumber = 1
	public var haloWidth: NSNumber = 87
	public var haloRadius: NSNumber = 70

	required public init(haloOverlap: NSNumber = 0.77, striationStrength: NSNumber = 0.5, center: CIVector = CIVector(values: [150.0, 150.0], count: 2), time: NSNumber = 0, color: CIColor = CIColor(red: 1.0, green: 0.9, blue: 0.8, alpha: 1.0), striationContrast: NSNumber = 1, haloWidth: NSNumber = 87, haloRadius: NSNumber = 70){
		self.haloOverlap = haloOverlap
		self.striationStrength = striationStrength
		self.center = center
		self.time = time
		self.color = color
		self.striationContrast = striationContrast
		self.haloWidth = haloWidth
		self.haloRadius = haloRadius
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CILenticularHaloGenerator") else { return nil }
		filter.setValue(haloOverlap, forKey: "inputHaloOverlap")
		filter.setValue(striationStrength, forKey: "inputStriationStrength")
		filter.setValue(center, forKey: "inputCenter")
		filter.setValue(time, forKey: "inputTime")
		filter.setValue(color, forKey: "inputColor")
		filter.setValue(striationContrast, forKey: "inputStriationContrast")
		filter.setValue(haloWidth, forKey: "inputHaloWidth")
		filter.setValue(haloRadius, forKey: "inputHaloRadius")
		return filter
	}

}