import CoreImage 

public class Droste { 

	public var rotation: NSNumber = 0
	public var strands: NSNumber = 1
	public var periodicity: NSNumber = 1
	public var insetPoint1: CIVector = CIVector(values: [400.0, 400.0], count: 2)
	public var image: CIImage
	public var insetPoint0: CIVector = CIVector(values: [200.0, 200.0], count: 2)
	public var zoom: NSNumber = 1

	required public init(rotation: NSNumber = 0, strands: NSNumber = 1, periodicity: NSNumber = 1, insetPoint1: CIVector = CIVector(values: [400.0, 400.0], count: 2), image: CIImage, insetPoint0: CIVector = CIVector(values: [200.0, 200.0], count: 2), zoom: NSNumber = 1){
		self.rotation = rotation
		self.strands = strands
		self.periodicity = periodicity
		self.insetPoint1 = insetPoint1
		self.image = image
		self.insetPoint0 = insetPoint0
		self.zoom = zoom
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIDroste") else { return nil }
		filter.setValue(rotation, forKey: "inputRotation")
		filter.setValue(strands, forKey: "inputStrands")
		filter.setValue(periodicity, forKey: "inputPeriodicity")
		filter.setValue(insetPoint1, forKey: "inputInsetPoint1")
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(insetPoint0, forKey: "inputInsetPoint0")
		filter.setValue(zoom, forKey: "inputZoom")
		return filter
	}

}

extension CIImage {

	public func drosteFilter(rotation: NSNumber = 0, strands: NSNumber = 1, periodicity: NSNumber = 1, insetPoint1: CIVector = CIVector(values: [400.0, 400.0], count: 2), insetPoint0: CIVector = CIVector(values: [200.0, 200.0], count: 2), zoom: NSNumber = 1) -> CIImage? {
		guard let filter = CIFilter(name: "CIDroste") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(rotation, forKey: "inputRotation")
		filter.setValue(strands, forKey: "inputStrands")
		filter.setValue(periodicity, forKey: "inputPeriodicity")
		filter.setValue(insetPoint1, forKey: "inputInsetPoint1")
		filter.setValue(insetPoint0, forKey: "inputInsetPoint0")
		filter.setValue(zoom, forKey: "inputZoom")
		return filter.outputImage
	}

}