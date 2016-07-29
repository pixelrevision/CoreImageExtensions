import CoreImage 

public class SpotColor { 

	public var contrast1: NSNumber = 0.98
	public var centerColor1: CIColor = CIColor(red: 0.0784, green: 0.0627, blue: 0.0706, alpha: 1.0)
	public var contrast3: NSNumber = 0.99
	public var centerColor3: CIColor = CIColor(red: 0.9216, green: 0.4549, blue: 0.3333, alpha: 1.0)
	public var replacementColor3: CIColor = CIColor(red: 0.9098, green: 0.7529, blue: 0.6078, alpha: 1.0)
	public var replacementColor1: CIColor = CIColor(red: 0.4392, green: 0.1922, blue: 0.1961, alpha: 1.0)
	public var image: CIImage
	public var closeness2: NSNumber = 0.15
	public var centerColor2: CIColor = CIColor(red: 0.5255, green: 0.3059, blue: 0.3451, alpha: 1.0)
	public var closeness1: NSNumber = 0.22
	public var closeness3: NSNumber = 0.5
	public var replacementColor2: CIColor = CIColor(red: 0.9137, green: 0.5608, blue: 0.5059, alpha: 1.0)
	public var contrast2: NSNumber = 0.98

	required public init(contrast1: NSNumber = 0.98, centerColor1: CIColor = CIColor(red: 0.0784, green: 0.0627, blue: 0.0706, alpha: 1.0), contrast3: NSNumber = 0.99, centerColor3: CIColor = CIColor(red: 0.9216, green: 0.4549, blue: 0.3333, alpha: 1.0), replacementColor3: CIColor = CIColor(red: 0.9098, green: 0.7529, blue: 0.6078, alpha: 1.0), replacementColor1: CIColor = CIColor(red: 0.4392, green: 0.1922, blue: 0.1961, alpha: 1.0), image: CIImage, closeness2: NSNumber = 0.15, centerColor2: CIColor = CIColor(red: 0.5255, green: 0.3059, blue: 0.3451, alpha: 1.0), closeness1: NSNumber = 0.22, closeness3: NSNumber = 0.5, replacementColor2: CIColor = CIColor(red: 0.9137, green: 0.5608, blue: 0.5059, alpha: 1.0), contrast2: NSNumber = 0.98){
		self.contrast1 = contrast1
		self.centerColor1 = centerColor1
		self.contrast3 = contrast3
		self.centerColor3 = centerColor3
		self.replacementColor3 = replacementColor3
		self.replacementColor1 = replacementColor1
		self.image = image
		self.closeness2 = closeness2
		self.centerColor2 = centerColor2
		self.closeness1 = closeness1
		self.closeness3 = closeness3
		self.replacementColor2 = replacementColor2
		self.contrast2 = contrast2
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CISpotColor") else { return nil }
		filter.setValue(contrast1, forKey: "inputContrast1")
		filter.setValue(centerColor1, forKey: "inputCenterColor1")
		filter.setValue(contrast3, forKey: "inputContrast3")
		filter.setValue(centerColor3, forKey: "inputCenterColor3")
		filter.setValue(replacementColor3, forKey: "inputReplacementColor3")
		filter.setValue(replacementColor1, forKey: "inputReplacementColor1")
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(closeness2, forKey: "inputCloseness2")
		filter.setValue(centerColor2, forKey: "inputCenterColor2")
		filter.setValue(closeness1, forKey: "inputCloseness1")
		filter.setValue(closeness3, forKey: "inputCloseness3")
		filter.setValue(replacementColor2, forKey: "inputReplacementColor2")
		filter.setValue(contrast2, forKey: "inputContrast2")
		return filter
	}

}

extension CIImage {

	public func spotColorFilter(contrast1: NSNumber = 0.98, centerColor1: CIColor = CIColor(red: 0.0784, green: 0.0627, blue: 0.0706, alpha: 1.0), contrast3: NSNumber = 0.99, centerColor3: CIColor = CIColor(red: 0.9216, green: 0.4549, blue: 0.3333, alpha: 1.0), replacementColor3: CIColor = CIColor(red: 0.9098, green: 0.7529, blue: 0.6078, alpha: 1.0), replacementColor1: CIColor = CIColor(red: 0.4392, green: 0.1922, blue: 0.1961, alpha: 1.0), closeness2: NSNumber = 0.15, centerColor2: CIColor = CIColor(red: 0.5255, green: 0.3059, blue: 0.3451, alpha: 1.0), closeness1: NSNumber = 0.22, closeness3: NSNumber = 0.5, replacementColor2: CIColor = CIColor(red: 0.9137, green: 0.5608, blue: 0.5059, alpha: 1.0), contrast2: NSNumber = 0.98) -> CIImage? {
		guard let filter = CIFilter(name: "CISpotColor") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(contrast1, forKey: "inputContrast1")
		filter.setValue(centerColor1, forKey: "inputCenterColor1")
		filter.setValue(contrast3, forKey: "inputContrast3")
		filter.setValue(centerColor3, forKey: "inputCenterColor3")
		filter.setValue(replacementColor3, forKey: "inputReplacementColor3")
		filter.setValue(replacementColor1, forKey: "inputReplacementColor1")
		filter.setValue(closeness2, forKey: "inputCloseness2")
		filter.setValue(centerColor2, forKey: "inputCenterColor2")
		filter.setValue(closeness1, forKey: "inputCloseness1")
		filter.setValue(closeness3, forKey: "inputCloseness3")
		filter.setValue(replacementColor2, forKey: "inputReplacementColor2")
		filter.setValue(contrast2, forKey: "inputContrast2")
		return filter.outputImage
	}

}