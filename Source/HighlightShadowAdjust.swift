import CoreImage 

public class HighlightShadowAdjust { 

	public var image: CIImage
	public var highlightAmount: NSNumber = 1
	public var shadowAmount: NSNumber = 0
	public var radius: NSNumber = 0

	required public init(image: CIImage, highlightAmount: NSNumber = 1, shadowAmount: NSNumber = 0, radius: NSNumber = 0){
		self.image = image
		self.highlightAmount = highlightAmount
		self.shadowAmount = shadowAmount
		self.radius = radius
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIHighlightShadowAdjust") else { return nil }
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(highlightAmount, forKey: "inputHighlightAmount")
		filter.setValue(shadowAmount, forKey: "inputShadowAmount")
		filter.setValue(radius, forKey: "inputRadius")
		return filter
	}

}

extension CIImage {

	public func highlightShadowAdjustFilter(highlightAmount: NSNumber = 1, shadowAmount: NSNumber = 0, radius: NSNumber = 0) -> CIImage? {
		guard let filter = CIFilter(name: "CIHighlightShadowAdjust") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(highlightAmount, forKey: "inputHighlightAmount")
		filter.setValue(shadowAmount, forKey: "inputShadowAmount")
		filter.setValue(radius, forKey: "inputRadius")
		return filter.outputImage
	}

}