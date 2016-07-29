# CoreImageExtensions

## What is it?

CoreImage is a fantastic framework but can be a chore to work with due to lots of magic strings. This library is a generated set of classes and extensions designed to make working with core image filters more type safe. This is useful when using in a Playground or if you want more type safety in your project. 

## Usage

You can use the filters as typed classes.

```
let filter = GaussianBlur(image: image, radius: 10).filter()
```

Or use the extensions on CIImage to chain filters:

```
let filtered = UIImage(named: "sample_image")?.CIImage?
	.gaussianBlurFilter(10)?
	.colorControlsFilter(0.1, saturation: 0.3, brightness: 1.0)
```

## Installation

If you use CocoaPods so you can just add a dependency your pod file:

```
platform :ios, '9.0'
use_frameworks!

target 'MyProject' do
	pod 'CoreImageExtensions', '~> 0.1.0'
end
```

Otherwise you can just open the Xcode project, build the framework and add it to your project.




