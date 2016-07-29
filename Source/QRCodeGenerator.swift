import CoreImage 

public class QRCodeGenerator { 

	public var message: NSData
	public var correctionLevel: NSString = "M"

	required public init(message: NSData, correctionLevel: NSString = "M"){
		self.message = message
		self.correctionLevel = correctionLevel
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIQRCodeGenerator") else { return nil }
		filter.setValue(message, forKey: "inputMessage")
		filter.setValue(correctionLevel, forKey: "inputCorrectionLevel")
		return filter
	}

}