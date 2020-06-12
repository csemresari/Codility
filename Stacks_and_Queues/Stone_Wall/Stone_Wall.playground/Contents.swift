public struct Stack<T> {
    
  /// Datastructure consisting of a generic item.
  fileprivate var array = [T]()

  /// The number of items in the stack.
  public var count: Int {
    return array.count
  }

  /// Verifies if the stack is empty.
  public var isEmpty: Bool {
    return array.isEmpty
  }

  /**
     Pushes an item to the top of the stack.
     
     - Parameter element: The item being pushed.
  */
  public mutating func push(_ element: T) {
    array.append(element)
  }

  /**
     Removes and returns the item at the top of the stack.
     
     - Returns: The item at the top of the stack.
  */
  public mutating func pop() -> T? {
    return array.popLast()
  }

  /// Returns the item at the top of the stack.
  public var top: T? {
    return array.last
  }
}

public func solution(_ H : inout [Int]) -> Int {
    
    var stack = Stack<Int>()
    var counter = 0
    outer: for item in H {
        
        if let top = stack.top {
            if item < top {
                counter += 1
                stack.pop()
                inner: while let t = stack.top {
                    if item < t {
                        counter += 1
                        stack.pop()
                    }else if item == t {
                        continue outer
                    }else{
                        break inner
                    }
                }
                stack.push(item)
            }else if item > top {
                stack.push(item)
            }else{
                // if item == top
                // do nothing
            }
        }else{
            stack.push(item)
        }
    }
    
    return counter + stack.count
}

var H = [8, 8, 5, 7, 9, 8, 7, 4, 8]
print(solution(&H))
