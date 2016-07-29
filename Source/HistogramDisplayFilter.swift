import CoreImage 

public class HistogramDisplayFilter { 

	public var image: CIImage
	public var lowLimit: NSNumber = 0
	public var highLimit: NSNumber = 1
	public var height: NSNumber = 100

	required public init(image: CIImage, lowLimit: NSNumber = 0, highLimit: NSNumber = 1, height: NSNumber = 100){
		self.image = image
		self.lowLimit = lowLimit
		self.highLimit = highLimit
		self.height = height
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIHistogramDisplayFilter") else { return nil }
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(lowLimit, forKey: "inputLowLimit")
		filter.setValue(highLimit, forKey: "inputHighLimit")
		filter.setValue(height, forKey: "inputHeight")
		return filter
	}

}

extension CIImage {

	public func histogramDisplayFilterFilter(lowLimit: NSNumber = 0, highLimit: NSNumber = 1, height: NSNumber = 100) -> CIImage? {
		guard let filter = CIFilter(name: "CIHistogramDisplayFilter") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(lowLimit, forKey: "inputLowLimit")
		filter.setValue(highLimit, forKey: "inputHighLimit")
		filter.setValue(height, forKey: "inputHeight")
		return filter.outputImage
	}

}