
// Rotate an array to the right by a given number of steps

import Foundation

public func solution(_ A : inout [Int], _ K : Int) -> [Int] {
    
    let c = A.count
    var array = Array(repeating: 0, count: c)
    
    for (index, item) in A.enumerated() {
        
        let newIndex = (index + K) % c
        array[newIndex] = item
    }
    
    return array
}
