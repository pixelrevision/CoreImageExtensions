import CoreImage 

public class ConstantColorGenerator { 

	public var color: CIColor = CIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)

	required public init(color: CIColor = CIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)){
		self.color = color
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIConstantColorGenerator") else { return nil }
		filter.setValue(color, forKey: "inputColor")
		return filter
	}

}