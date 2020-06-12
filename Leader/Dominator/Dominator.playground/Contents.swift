
// Find an index of an array such that its value occurs at more than half of indices in the array.

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

public func solution(_ A : inout [Int]) -> Int {
    
    var stack = Stack<Int>()
    var index = -1
    outer: for item in A {
        if let top = stack.top {
            if item != top {
                stack.pop()
                print(stack)
                continue outer
            }
        }
        stack.push(item)
        print(stack)
    }
    
    guard let element = stack.top else { return index }
    
    if (A.filter{$0 == element}.count) > A.count/2 {
        for (i,item) in A.enumerated(){
            if stack.top! == item {
                index = i
                break
            }
        }
    }
    
    return index
}

var A = [3, 4, 3, 2, 3, -1, 3, 3]
print(solution(&A))
