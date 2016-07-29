import CoreImage 

public class PDF417BarcodeGenerator { 

	public var maxWidth: NSNumber
	public var preferredAspectRatio: NSNumber
	public var maxHeight: NSNumber
	public var dataColumns: NSNumber
	public var minHeight: NSNumber
	public var message: NSData
	public var minWidth: NSNumber
	public var rows: NSNumber
	public var compactionMode: NSNumber
	public var compactStyle: NSNumber
	public var correctionLevel: NSNumber
	public var alwaysSpecifyCompaction: NSNumber

	required public init(maxWidth: NSNumber, preferredAspectRatio: NSNumber, maxHeight: NSNumber, dataColumns: NSNumber, minHeight: NSNumber, message: NSData, minWidth: NSNumber, rows: NSNumber, compactionMode: NSNumber, compactStyle: NSNumber, correctionLevel: NSNumber, alwaysSpecifyCompaction: NSNumber){
		self.maxWidth = maxWidth
		self.preferredAspectRatio = preferredAspectRatio
		self.maxHeight = maxHeight
		self.dataColumns = dataColumns
		self.minHeight = minHeight
		self.message = message
		self.minWidth = minWidth
		self.rows = rows
		self.compactionMode = compactionMode
		self.compactStyle = compactStyle
		self.correctionLevel = correctionLevel
		self.alwaysSpecifyCompaction = alwaysSpecifyCompaction
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIPDF417BarcodeGenerator") else { return nil }
		filter.setValue(maxWidth, forKey: "inputMaxWidth")
		filter.setValue(preferredAspectRatio, forKey: "inputPreferredAspectRatio")
		filter.setValue(maxHeight, forKey: "inputMaxHeight")
		filter.setValue(dataColumns, forKey: "inputDataColumns")
		filter.setValue(minHeight, forKey: "inputMinHeight")
		filter.setValue(message, forKey: "inputMessage")
		filter.setValue(minWidth, forKey: "inputMinWidth")
		filter.setValue(rows, forKey: "inputRows")
		filter.setValue(compactionMode, forKey: "inputCompactionMode")
		filter.setValue(compactStyle, forKey: "inputCompactStyle")
		filter.setValue(correctionLevel, forKey: "inputCorrectionLevel")
		filter.setValue(alwaysSpecifyCompaction, forKey: "inputAlwaysSpecifyCompaction")
		return filter
	}

}