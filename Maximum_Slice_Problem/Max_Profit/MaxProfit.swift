/*
 
 Max Profit
 - Given a log of stock prices compute the maximum possible earning.

*/

public func solution(_ A : inout [Int]) -> Int {
    
    var minItem = Int.max
    var maxProfit = 0
    
    for item in A{
        minItem = min(minItem, item)
        maxProfit = max(maxProfit, item - minItem)
    }
    
    return maxProfit
}
