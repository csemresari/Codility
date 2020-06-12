
// Check whether array A is a permutation.

public func solution(_ A : inout [Int]) -> Int {
    var set : Set<Int> = []
    for value in A {
        set.insert(value)
    }
    if set.count == A.max()! && set.count == A.count{
        return 1
    }else{
        return 0
    }
}
