import CoreImage 

public class ColorCrossPolynomial { 

	public var blueCoefficients: CIVector = CIVector(values: [0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], count: 10)
	public var greenCoefficients: CIVector = CIVector(values: [0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], count: 10)
	public var image: CIImage
	public var redCoefficients: CIVector = CIVector(values: [1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], count: 10)

	required public init(blueCoefficients: CIVector = CIVector(values: [0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], count: 10), greenCoefficients: CIVector = CIVector(values: [0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], count: 10), image: CIImage, redCoefficients: CIVector = CIVector(values: [1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], count: 10)){
		self.blueCoefficients = blueCoefficients
		self.greenCoefficients = greenCoefficients
		self.image = image
		self.redCoefficients = redCoefficients
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIColorCrossPolynomial") else { return nil }
		filter.setValue(blueCoefficients, forKey: "inputBlueCoefficients")
		filter.setValue(greenCoefficients, forKey: "inputGreenCoefficients")
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(redCoefficients, forKey: "inputRedCoefficients")
		return filter
	}

}

extension CIImage {

	public func colorCrossPolynomialFilter(blueCoefficients: CIVector = CIVector(values: [0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], count: 10), greenCoefficients: CIVector = CIVector(values: [0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], count: 10), redCoefficients: CIVector = CIVector(values: [1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0], count: 10)) -> CIImage? {
		guard let filter = CIFilter(name: "CIColorCrossPolynomial") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(blueCoefficients, forKey: "inputBlueCoefficients")
		filter.setValue(greenCoefficients, forKey: "inputGreenCoefficients")
		filter.setValue(redCoefficients, forKey: "inputRedCoefficients")
		return filter.outputImage
	}

}