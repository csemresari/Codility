/*

   Max Double Slice Sum
   - Find the maximal sum of any double slice.

*/

public func solution(_ A : inout [Int]) -> Int {
    
    let n = A.count
    if n == 3 { return 0 }
    var maxEndingUntilIndex = Array(repeating: 0, count: n+1)
    var maxEndingFromIndex = Array(repeating: 0, count: n+1)
    var maxResult = 0
    
    for i in (1...n-2) {
        maxEndingUntilIndex[i] = max(0, maxEndingUntilIndex[i-1] + A[i])
    }
    
    for i in (1...n-2).reversed() {
        maxEndingFromIndex[i] = max(0, maxEndingFromIndex[i+1] + A[i])
    }
    
    var sum = 0
    for i in 0...n-3 {
        sum = maxEndingUntilIndex[i] + maxEndingFromIndex[i+2]
        maxResult = max(maxResult, sum)
    }
    
    return maxResult
}
