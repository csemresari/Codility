
// Find the missing element in a given permutation.

public func solution(_ A : inout [Int]) -> Int {
    
    let count = A.count
    
    if count == 0 {
        return 1
    }
    
    var dict = Dictionary<Int,Bool>(minimumCapacity: count+1)
    
    for num in 1...count+1 {
        dict.updateValue(false, forKey: num)
    }
    
    for item in A {
        dict.updateValue(true, forKey: item)
    }
    
    for (index,value) in dict{
        
        if value == false {
            return index
        }
    }
    
    return 1
}
