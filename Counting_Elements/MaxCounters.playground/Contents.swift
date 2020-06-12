
// Calculate the values of counters after applying all alternating operations: increase counter by 1; set value of all counters to current maximum.

public func solution(_ N : Int, _ A : inout [Int]) -> [Int] {
    var counters = Array(repeating: 0, count: N)
    var currentMax = 0
    for value in A {
        if value == N + 1 {
            counters = Array(repeating: currentMax, count: N)
        }else{
            counters[value - 1] += 1
            currentMax = max(counters[value - 1], currentMax)
        }
    }
    return counters
}
