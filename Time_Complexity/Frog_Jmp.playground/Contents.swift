
// Count minimal number of jumps from position X to Y.

public func solution(_ X : Int, _ Y : Int, _ D : Int) -> Int {
    
    if (Y - X) % D == 0 {
        return (Y - X) / D
    }else{
        return (Y - X) / D + 1
    }
}
