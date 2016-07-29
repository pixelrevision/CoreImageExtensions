Pod::Spec.new do |spec|
	spec.name = "CoreImageExtensions"
	spec.version = "0.1.0"
	spec.license = { :type => "BSD" }
	spec.homepage = "https://github.com/pixelrevision/CoreImageExtensions"
	spec.authors = {"Malcolm Wilson" => "pixelrevision@gmail.com"}
	spec.summary = "Type saftey and chaining for CoreImage filters."
	spec.source = { :git => "https://github.com/pixelrevision/CoreImageExtensions.git", :tag => "0.1.0" }
	spec.source_files = "Source/*.swift"
	spec.framework = "CoreImage"
end