import CoreImage 

public class RandomGenerator { 


	required public init(){
	}

	public func filter() -> CIFilter? {
		guard let filter = CIFilter(name: "CIRandomGenerator") else { return nil }
		return filter
	}

}