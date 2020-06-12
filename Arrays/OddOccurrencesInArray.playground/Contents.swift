
// Find value that occurs in odd number of elements.

public func solution(_ A : inout [Int]) -> Int {
    
    var unpairedSet : Set<Int> = []
    
    for item in A {
        
        if unpairedSet.contains(item) {
            unpairedSet.remove(item)
        }else{
            unpairedSet.insert(item)
        }
    }
    
    return unpairedSet.first!
}
