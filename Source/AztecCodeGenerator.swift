import CoreImage 

public class AztecCodeGenerator { 

	public var message: NSData
	public var compactStyle: NSNumber
	public var layers: NSNumber
	public var correctionLevel: NSNumber = 23

	required public init(message: NSData, compactStyle: NSNumber, layers: NSNumber, correctionLevel: NSNumber = 23){
		self.message = message
		self.compactStyle = compactStyle
		self.layers = layers
		self.correctionLevel = correctionLevel
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIAztecCodeGenerator") else { return nil }
		filter.setValue(message, forKey: "inputMessage")
		filter.setValue(compactStyle, forKey: "inputCompactStyle")
		filter.setValue(layers, forKey: "inputLayers")
		filter.setValue(correctionLevel, forKey: "inputCorrectionLevel")
		return filter
	}

}