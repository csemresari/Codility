
// Minimize the value |(A[0] + ... + A[P-1]) - (A[P] + ... + A[N-1])|.

public func solution(_ A : inout [Int]) -> Int {
    
    var minDifference = Int.max
    let totalSumOfArrayA = A.reduce(0, +)
    var sumOfLeftPart = 0
    var sumOfRightPart = 0
    
    if A.count == 2 {
        return abs(A[1] - A[0])
    }
    
    for i in 1...A.count-1 {
        
        sumOfLeftPart += A[i-1]
        sumOfRightPart = totalSumOfArrayA - sumOfLeftPart
        let difference = abs(sumOfLeftPart - sumOfRightPart)
        
        if difference < minDifference {
            minDifference = difference
        }
    }
    
    return minDifference
}
