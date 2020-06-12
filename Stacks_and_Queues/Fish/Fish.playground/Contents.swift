public struct Stack<T> {
    fileprivate var array = [T]()
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
    public mutating func push(_ element: T) {
        array.append(element)
    }
    
    public mutating func pop() -> T? {
        return array.popLast()
    }
    
    public var top: T? {
        return array.last
    }
}

extension Stack: Sequence {
    public func makeIterator() -> AnyIterator<T> {
        var curr = self
        return AnyIterator {
            return curr.pop()
        }
    }
}

public func solution(_ A : inout [Int], _ B : inout [Int]) -> Int {
    
    var stack = Stack<Int>()
    let N = A.count
    var live = N
    
    for i in 0...N-1 {
        if B[i] == 0 {
            inner: while let top = stack.top {
                if A[top] < A[i]{
                    stack.pop()
                    live -= 1
                }else{
                    live -= 1
                    break inner
                }
            }
        }else{
            stack.push(i)
        }
    }
    
    return live
}

//var A = [4,3,2,1,5]
//var B = [0,1,0,0,0]

var A = [7,3,4,5,6,2,1]
var B = [1,0,0,0,0,0,0]
//var B = [1,1,1,1,1,1,0]
solution(&A, &B)

