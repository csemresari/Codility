
// Find the index S such that the leaders of the sequences A[0], A[1], ..., A[S] and A[S + 1], A[S + 2], ..., A[N - 1] are the same.

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
    
    if A.count == 1 {return 0}
    var dict = Dictionary<Int,Int>()
    for item in A{
        dict[item] = 1 + (dict[item] ?? 0)
    }
    if let max = dict.values.max(), !(max > A.count/2) {
        return 0
    }
    
    var counter = 0
    var leftDict = Dictionary<Int,Int>()
    var rightDict = dict
    outer: for i in 0...A.count-1 {
        let v = A[i]
        leftDict[v] = 1 + (leftDict[v] ?? 0)
        rightDict[v] = (rightDict[v] != nil && rightDict[v] != 1) ? (rightDict[v]! - 1) : nil
        
        guard let maxValueInLeft = leftDict.values.max() else { continue outer}
        let dominantInLeft = leftDict.first(where: {$0.value == maxValueInLeft})!.key
        let isThereLeftLeader = maxValueInLeft > leftDict.values.reduce(0,+)/2
        
        guard let maxValueInRight = rightDict.values.max() else { continue outer}
        let dominantInRight = rightDict.first(where: {$0.value == maxValueInRight})!.key
        let isThereRightLeader = maxValueInRight > rightDict.values.reduce(0,+)/2
     
        if isThereLeftLeader && isThereRightLeader && (dominantInLeft == dominantInRight) {
            counter += 1
        }
    }
    return counter
}


//var A = [4, 3, 4, 4, 4, 2]
//var A = [0,0,1]
var A = [4, 4, 2, 5, 3, 4, 4, 4]
print(solution(&A))
