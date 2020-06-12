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
