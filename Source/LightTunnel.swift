import CoreImage 

public class LightTunnel { 

	public var image: CIImage
	public var rotation: NSNumber = 0
	public var center: CIVector = CIVector(values: [150.0, 150.0], count: 2)
	public var radius: NSNumber = 100

	required public init(image: CIImage, rotation: NSNumber = 0, center: CIVector = CIVector(values: [150.0, 150.0], count: 2), radius: NSNumber = 100){
		self.image = image
		self.rotation = rotation
		self.center = center
		self.radius = radius
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CILightTunnel") else { return nil }
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(rotation, forKey: "inputRotation")
		filter.setValue(center, forKey: "inputCenter")
		filter.setValue(radius, forKey: "inputRadius")
		return filter
	}

}

extension CIImage {

	public func lightTunnelFilter(rotation: NSNumber = 0, center: CIVector = CIVector(values: [150.0, 150.0], count: 2), radius: NSNumber = 100) -> CIImage? {
		guard let filter = CIFilter(name: "CILightTunnel") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(rotation, forKey: "inputRotation")
		filter.setValue(center, forKey: "inputCenter")
		filter.setValue(radius, forKey: "inputRadius")
		return filter.outputImage
	}

}