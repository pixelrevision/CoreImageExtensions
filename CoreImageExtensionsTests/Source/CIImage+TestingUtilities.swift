import CoreImage
import UIKit

public extension CIImage{
	
	public convenience init?(name: String, classForBundle: AnyClass) {
		let bundle = NSBundle(forClass: classForBundle)
		let imageName = name.containsString(".") ? name : "\(name).png"
		let url = bundle.bundleURL.URLByAppendingPathComponent(imageName)
		self.init(contentsOfURL: url)
	}
	
    public func getPNGData() -> NSData {
        let ctx = CIContext(options: [:])
        let ref = ctx.createCGImage(self, fromRect: extent)
        return UIImagePNGRepresentation(UIImage(CGImage: ref))!
    }
	
	override public func isEqual(object: AnyObject?) -> Bool {
		guard let rightImage = object as? CIImage else {return false}
		let lData = getPNGData()
		let rData = rightImage.getPNGData()
		return lData.isEqualToData(rData)
	}
}






