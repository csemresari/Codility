// Find the minimal nucleotide from a range of sequence DNA.


public func solution(_ S : inout String, _ P : inout [Int], _ Q : inout [Int]) -> [Int] {
    
    let c = S.count
    var A_Counter = Array(repeating: 0, count: c)
    var C_Counter = Array(repeating: 0, count: c)
    var G_Counter = Array(repeating: 0, count: c)
    var T_Counter = Array(repeating: 0, count: c)
    var arr: [Int] = []
    
    let first = S[S.startIndex]
    if first == "A" {
        A_Counter[0] = 1
    }else if first == "C" {
        C_Counter[0] += 1
    }else if first == "G" {
        G_Counter[0] += 1
    }else if first == "T" {
        T_Counter[0] += 1
    }
    
    for i in 1..<S.count {
        
        A_Counter[i] = A_Counter[i-1];
        C_Counter[i] = C_Counter[i-1];
        G_Counter[i] = G_Counter[i-1];
        T_Counter[i] = T_Counter[i-1];
        
        let char = S[S.index(S.startIndex, offsetBy: i)]
        
        if char == "A" {
            A_Counter[i] += 1
        }else if char == "C" {
            C_Counter[i] += 1
        }else if char == "G" {
            G_Counter[i] += 1
        }else if char == "T" {
            T_Counter[i] += 1
        }
    }
    
    for i in 0..<P.count {
        
        let s = P[i]
        let e = Q[i]
        let char = S[S.index(S.startIndex, offsetBy: s)]
        
        print(s, e, char, A_Counter, C_Counter, G_Counter, T_Counter)
        
        if A_Counter[s] < A_Counter[e] || char == "A"{
            arr.append(1)
        }else if C_Counter[s] < C_Counter[e] || char == "C"{
            arr.append(2)
        }else if G_Counter[s] < G_Counter[e] || char == "G"{
            arr.append(3)
        }else{
            arr.append(4)
        }
    }
    
    return arr
}


var S = "CA"
var P = [0,0,1]
var Q = [0,1,1]

print(solution(&S, &P, &Q))
