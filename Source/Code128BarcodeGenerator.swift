import CoreImage 

public class Code128BarcodeGenerator { 

	public var message: NSData
	public var quietSpace: NSNumber = 7

	required public init(message: NSData, quietSpace: NSNumber = 7){
		self.message = message
		self.quietSpace = quietSpace
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CICode128BarcodeGenerator") else { return nil }
		filter.setValue(message, forKey: "inputMessage")
		filter.setValue(quietSpace, forKey: "inputQuietSpace")
		return filter
	}

}