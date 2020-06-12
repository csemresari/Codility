
// Find the smallest positive integer that does not occur in a given sequence.

public func solution(_ A : inout [Int]) -> Int {
    A = A.sorted()
    var minPositive = 1
    for value in A {
        if value == minPositive {
            minPositive += 1
        }
    }
    return minPositive
}
