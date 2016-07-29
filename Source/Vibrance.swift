import CoreImage 

public class Vibrance { 

	public var image: CIImage
	public var amount: NSNumber = 0

	required public init(image: CIImage, amount: NSNumber = 0){
		self.image = image
		self.amount = amount
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIVibrance") else { return nil }
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(amount, forKey: "inputAmount")
		return filter
	}

}

extension CIImage {

	public func vibranceFilter(amount: NSNumber = 0) -> CIImage? {
		guard let filter = CIFilter(name: "CIVibrance") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(amount, forKey: "inputAmount")
		return filter.outputImage
	}

}