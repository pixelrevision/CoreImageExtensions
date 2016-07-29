import XCTest
import CoreImage

public func AssertFilterEqualityForImages(filter1: CIFilter?, filter2: CIFilter?, classForBundle: AnyClass) -> (passes: Bool, message: String) {
	guard let f1 = filter1, f2 = filter2
		else {
			return (false, "Filters cannot be nil")
		}
	let ctx = CIContext()

	guard
		let image1 = CIImage(name: "sample_image_1", classForBundle: classForBundle),
		image2 = CIImage(name: "sample_image_2", classForBundle: classForBundle),
		image3 = CIImage(name: "sample_image_1", classForBundle: classForBundle)
	else{
		return (false, "Bundle class is not working")
	}
	
	f1.setValue(image1, forKeyPath: kCIInputImageKey)
	f2.setValue(image2, forKeyPath: kCIInputImageKey)
	
	guard
		let out1 = f1.outputImage,
		out2 = f2.outputImage
		else{
			return (false, "Filter is not generating an image")
	}
	
	let cgImageOut1 = ctx.createCGImage(out1, fromRect: image1.extent)
	let cgImageOut2 = ctx.createCGImage(out2, fromRect: image2.extent)
	if CIImage(CGImage: cgImageOut1) == CIImage(CGImage: cgImageOut2) {
		return (false, "Filter is generating equal images on seperate inputs")
	}
	
	f2.setValue(image3, forKeyPath: kCIInputImageKey)
	guard
		let out3 = f2.outputImage
		else{
			return (false, "Filter is not generating an image")
	}
	let cgImageOut3 = ctx.createCGImage(out3, fromRect: image3.extent)
	if CIImage(CGImage: cgImageOut1) != CIImage(CGImage: cgImageOut3) {
		return (false, "Filter is generating non equal images on identical inputs")
	}
	
	return (true, "Image equality passes")
}