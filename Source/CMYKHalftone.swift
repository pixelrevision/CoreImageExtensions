import CoreImage 

public class CMYKHalftone { 

	public var width: NSNumber = 6
	public var center: CIVector = CIVector(values: [150.0, 150.0], count: 2)
	public var angle: NSNumber = 0
	public var uCR: NSNumber = 0.5
	public var sharpness: NSNumber = 0.7
	public var gCR: NSNumber = 1
	public var image: CIImage

	required public init(width: NSNumber = 6, center: CIVector = CIVector(values: [150.0, 150.0], count: 2), angle: NSNumber = 0, uCR: NSNumber = 0.5, sharpness: NSNumber = 0.7, gCR: NSNumber = 1, image: CIImage){
		self.width = width
		self.center = center
		self.angle = angle
		self.uCR = uCR
		self.sharpness = sharpness
		self.gCR = gCR
		self.image = image
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CICMYKHalftone") else { return nil }
		filter.setValue(width, forKey: "inputWidth")
		filter.setValue(center, forKey: "inputCenter")
		filter.setValue(angle, forKey: "inputAngle")
		filter.setValue(uCR, forKey: "inputUCR")
		filter.setValue(sharpness, forKey: "inputSharpness")
		filter.setValue(gCR, forKey: "inputGCR")
		filter.setValue(image, forKey: "inputImage")
		return filter
	}

}

extension CIImage {

	public func cMYKHalftoneFilter(width: NSNumber = 6, center: CIVector = CIVector(values: [150.0, 150.0], count: 2), angle: NSNumber = 0, uCR: NSNumber = 0.5, sharpness: NSNumber = 0.7, gCR: NSNumber = 1) -> CIImage? {
		guard let filter = CIFilter(name: "CICMYKHalftone") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(width, forKey: "inputWidth")
		filter.setValue(center, forKey: "inputCenter")
		filter.setValue(angle, forKey: "inputAngle")
		filter.setValue(uCR, forKey: "inputUCR")
		filter.setValue(sharpness, forKey: "inputSharpness")
		filter.setValue(gCR, forKey: "inputGCR")
		return filter.outputImage
	}

}