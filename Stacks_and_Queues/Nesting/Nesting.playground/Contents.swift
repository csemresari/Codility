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


public func solution(_ S : inout String) -> Int {
    
    var stack = Stack<Character>()
    for char in S {
        if let top = stack.top {
            if top == "(" && char == ")" {
                stack.pop()
            }else{
                stack.push(char)
            }
        }else{
            stack.push(char)
        }
    }
    
    return stack.count == 0 ? 1 : 0
}

var S = ")((()))"
solution(&S)
