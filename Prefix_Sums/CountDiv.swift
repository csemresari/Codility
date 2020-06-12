// Compute number of integers divisible by k in range [a..b].

public func solution(_ A : Int, _ B : Int, _ K : Int) -> Int {

    if A == 0 {
        if B == 0 {
            return 1
        }else{
            return B / K + 1
        }
    }
    
    let divisionNumberForB = B / K
    let divisionNumberForA = (A - 1) / K
    return divisionNumberForB - divisionNumberForA
}
