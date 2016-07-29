import CoreImage 

public class StretchCrop { 

	public var size: CIVector = CIVector(values: [1280.0, 720.0], count: 2)
	public var image: CIImage
	public var cropAmount: NSNumber = 0.25
	public var centerStretchAmount: NSNumber = 0.25

	required public init(size: CIVector = CIVector(values: [1280.0, 720.0], count: 2), image: CIImage, cropAmount: NSNumber = 0.25, centerStretchAmount: NSNumber = 0.25){
		self.size = size
		self.image = image
		self.cropAmount = cropAmount
		self.centerStretchAmount = centerStretchAmount
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIStretchCrop") else { return nil }
		filter.setValue(size, forKey: "inputSize")
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(cropAmount, forKey: "inputCropAmount")
		filter.setValue(centerStretchAmount, forKey: "inputCenterStretchAmount")
		return filter
	}

}

extension CIImage {

	public func stretchCropFilter(size: CIVector = CIVector(values: [1280.0, 720.0], count: 2), cropAmount: NSNumber = 0.25, centerStretchAmount: NSNumber = 0.25) -> CIImage? {
		guard let filter = CIFilter(name: "CIStretchCrop") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(size, forKey: "inputSize")
		filter.setValue(cropAmount, forKey: "inputCropAmount")
		filter.setValue(centerStretchAmount, forKey: "inputCenterStretchAmount")
		return filter.outputImage
	}

}