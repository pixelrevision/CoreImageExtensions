import CoreImage 

public class Crop { 

	public var image: CIImage
	public var rectangle: CIVector = CIVector(values: [-8.98846567431158e+307, -8.98846567431158e+307, 1.79769313486232e+308, 1.79769313486232e+308], count: 4)

	required public init(image: CIImage, rectangle: CIVector = CIVector(values: [-8.98846567431158e+307, -8.98846567431158e+307, 1.79769313486232e+308, 1.79769313486232e+308], count: 4)){
		self.image = image
		self.rectangle = rectangle
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CICrop") else { return nil }
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(rectangle, forKey: "inputRectangle")
		return filter
	}

}

extension CIImage {

	public func cropFilter(rectangle: CIVector = CIVector(values: [-8.98846567431158e+307, -8.98846567431158e+307, 1.79769313486232e+308, 1.79769313486232e+308], count: 4)) -> CIImage? {
		guard let filter = CIFilter(name: "CICrop") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(rectangle, forKey: "inputRectangle")
		return filter.outputImage
	}

}