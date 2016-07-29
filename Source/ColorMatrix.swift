import CoreImage 

public class ColorMatrix { 

	public var biasVector: CIVector = CIVector(values: [0.0, 0.0, 0.0, 0.0], count: 4)
	public var image: CIImage
	public var aVector: CIVector = CIVector(values: [0.0, 0.0, 0.0, 1.0], count: 4)
	public var gVector: CIVector = CIVector(values: [0.0, 1.0, 0.0, 0.0], count: 4)
	public var bVector: CIVector = CIVector(values: [0.0, 0.0, 1.0, 0.0], count: 4)
	public var rVector: CIVector = CIVector(values: [1.0, 0.0, 0.0, 0.0], count: 4)

	required public init(biasVector: CIVector = CIVector(values: [0.0, 0.0, 0.0, 0.0], count: 4), image: CIImage, aVector: CIVector = CIVector(values: [0.0, 0.0, 0.0, 1.0], count: 4), gVector: CIVector = CIVector(values: [0.0, 1.0, 0.0, 0.0], count: 4), bVector: CIVector = CIVector(values: [0.0, 0.0, 1.0, 0.0], count: 4), rVector: CIVector = CIVector(values: [1.0, 0.0, 0.0, 0.0], count: 4)){
		self.biasVector = biasVector
		self.image = image
		self.aVector = aVector
		self.gVector = gVector
		self.bVector = bVector
		self.rVector = rVector
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIColorMatrix") else { return nil }
		filter.setValue(biasVector, forKey: "inputBiasVector")
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(aVector, forKey: "inputAVector")
		filter.setValue(gVector, forKey: "inputGVector")
		filter.setValue(bVector, forKey: "inputBVector")
		filter.setValue(rVector, forKey: "inputRVector")
		return filter
	}

}

extension CIImage {

	public func colorMatrixFilter(biasVector: CIVector = CIVector(values: [0.0, 0.0, 0.0, 0.0], count: 4), aVector: CIVector = CIVector(values: [0.0, 0.0, 0.0, 1.0], count: 4), gVector: CIVector = CIVector(values: [0.0, 1.0, 0.0, 0.0], count: 4), bVector: CIVector = CIVector(values: [0.0, 0.0, 1.0, 0.0], count: 4), rVector: CIVector = CIVector(values: [1.0, 0.0, 0.0, 0.0], count: 4)) -> CIImage? {
		guard let filter = CIFilter(name: "CIColorMatrix") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(biasVector, forKey: "inputBiasVector")
		filter.setValue(aVector, forKey: "inputAVector")
		filter.setValue(gVector, forKey: "inputGVector")
		filter.setValue(bVector, forKey: "inputBVector")
		filter.setValue(rVector, forKey: "inputRVector")
		return filter.outputImage
	}

}