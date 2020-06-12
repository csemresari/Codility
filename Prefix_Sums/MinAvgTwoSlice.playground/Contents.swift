// Find the minimal average of any slice containing at least two elements.

public func solution(_ A : inout [Int]) -> Int {
    
    let count = A.count
    var minAverage = Double.greatestFiniteMagnitude
    var firstIndex = 0
    
    if count == 2 {
        return 0
    }
    
    for i in 2...(count-1) {
        
        for j in 0...(count-i) {
            
            let sub = A[j...j+i-1]
            let sum = sub.reduce(0, +)
            
            let av = Double(sum) / Double(i)
            
            if av < minAverage {
                minAverage = av
                firstIndex = j
            }
        }
    }
    
    return firstIndex
}
