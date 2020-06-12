// Find the earliest time when a frog can jump to the other side of a river.

public func solution(_ X : Int, _ A : inout [Int]) -> Int {
    
    var levelSet : Set<Int> = []
    
    for (index, value) in A.enumerated() {
        
        if value <= X {
            levelSet.insert(value)
        }
        
        if levelSet.count == X {
            return index
        }
    }
    
    return -1
}
