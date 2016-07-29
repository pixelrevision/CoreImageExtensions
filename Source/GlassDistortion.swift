import CoreImage 

public class GlassDistortion { 

	public var image: CIImage
	public var center: CIVector = CIVector(values: [150.0, 150.0], count: 2)
	public var scale: NSNumber = 200
	public var texture: CIImage

	required public init(image: CIImage, center: CIVector = CIVector(values: [150.0, 150.0], count: 2), scale: NSNumber = 200, texture: CIImage){
		self.image = image
		self.center = center
		self.scale = scale
		self.texture = texture
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIGlassDistortion") else { return nil }
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(center, forKey: "inputCenter")
		filter.setValue(scale, forKey: "inputScale")
		filter.setValue(texture, forKey: "inputTexture")
		return filter
	}

}

extension CIImage {

	public func glassDistortionFilter(center: CIVector = CIVector(values: [150.0, 150.0], count: 2), scale: NSNumber = 200, texture: CIImage) -> CIImage? {
		guard let filter = CIFilter(name: "CIGlassDistortion") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(center, forKey: "inputCenter")
		filter.setValue(scale, forKey: "inputScale")
		filter.setValue(texture, forKey: "inputTexture")
		return filter.outputImage
	}

}