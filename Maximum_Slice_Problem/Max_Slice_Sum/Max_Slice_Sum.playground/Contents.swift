/*

Max Slice Sum
- Find a maximum sum of a compact subsequence of array elements.

*/

public func solution(_ A : inout [Int]) -> Int {
    
    var maxEnding = 0
    var maxValue = Int.min
    for item in A{
        maxEnding = maxEnding + item
        if maxValue < maxEnding {
            maxValue = maxEnding
        }
        if maxEnding < 0 {
            maxEnding = 0
        }
    }
    return maxValue
}

//var A = [3, 2, -6, 4, 0]      // Expected Result: 5
//var A = [0]                   // Expected Result: 0
//var A = [-10]                 // Expected Result: 10
//var A = [-2, 1]               // Expected Result: 1
//var A = [1, 1, 1]             // Expected Result: 3
//var A = [-1,-1]               // Expected Result: -1
//var A = [-2, 1, 1]            // Expected Result: 2
//var A = [-2, 1, -2]           // Expected Result: 1
//print(solution(&A))
