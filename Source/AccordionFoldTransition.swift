import CoreImage 

public class AccordionFoldTransition { 

	public var foldShadowAmount: NSNumber = 0.1
	public var targetImage: CIImage
	public var numberOfFolds: NSNumber = 3
	public var image: CIImage
	public var bottomHeight: NSNumber = 0
	public var time: NSNumber = 0

	required public init(foldShadowAmount: NSNumber = 0.1, targetImage: CIImage, numberOfFolds: NSNumber = 3, image: CIImage, bottomHeight: NSNumber = 0, time: NSNumber = 0){
		self.foldShadowAmount = foldShadowAmount
		self.targetImage = targetImage
		self.numberOfFolds = numberOfFolds
		self.image = image
		self.bottomHeight = bottomHeight
		self.time = time
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIAccordionFoldTransition") else { return nil }
		filter.setValue(foldShadowAmount, forKey: "inputFoldShadowAmount")
		filter.setValue(targetImage, forKey: "inputTargetImage")
		filter.setValue(numberOfFolds, forKey: "inputNumberOfFolds")
		filter.setValue(image, forKey: "inputImage")
		filter.setValue(bottomHeight, forKey: "inputBottomHeight")
		filter.setValue(time, forKey: "inputTime")
		return filter
	}

}

extension CIImage {

	public func accordionFoldTransitionFilter(foldShadowAmount: NSNumber = 0.1, targetImage: CIImage, numberOfFolds: NSNumber = 3, bottomHeight: NSNumber = 0, time: NSNumber = 0) -> CIImage? {
		guard let filter = CIFilter(name: "CIAccordionFoldTransition") else { return nil }
		filter.setValue(self, forKey: "inputImage")
		filter.setValue(foldShadowAmount, forKey: "inputFoldShadowAmount")
		filter.setValue(targetImage, forKey: "inputTargetImage")
		filter.setValue(numberOfFolds, forKey: "inputNumberOfFolds")
		filter.setValue(bottomHeight, forKey: "inputBottomHeight")
		filter.setValue(time, forKey: "inputTime")
		return filter.outputImage
	}

}