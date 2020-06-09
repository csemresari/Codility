import Foundation

// Find longest sequence of zeros in binary representation of an integer.

public func solution(_ N : Int) -> Int {
    
    let binaryString = String(N, radix: 2)
    
    var maxGapSize = 0
    var counter = 0
    var foundZero = false
    
    for char in binaryString {
        
        if foundZero {
            if char == "0" {
                counter += 1
            }else{
                foundZero = false
                maxGapSize = max(counter, maxGapSize)
                counter = 0
            }
        }else if char == "0" {
            foundZero = true
            counter += 1
        }
        
    }
    
    return maxGapSize
}
