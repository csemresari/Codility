// Maximize A[P] * A[Q] * A[R] for any triplet (P, Q, R).

import PlaygroundSupport
import XCTest

class Tests: XCTestCase {
    
    func testEmpty() {
        var a: [Int] = []
        let actual = solution(&a)
        let expected = -1
        XCTAssertEqual(actual, expected)
    }
    
    func testPositives() {
        var a = [1,2,3,4,5]
        let actual = solution(&a)
        let expected = 3 * 4 * 5
        XCTAssertEqual(actual, expected)
    }
    
    func testNegatives() {
        var a = [-1,-2,-3,-4,-5]
        let actual = solution(&a)
        let expected = (-1) * (-2) * (-3)
        XCTAssertEqual(actual, expected)
    }
    
    func testGiven() {
        var a = [-3, 1, 2, -2, 5, 6]
        let actual = solution(&a)
        let expected = 60
        XCTAssertEqual(actual, expected)
    }
}

public struct TestRunner {
    public init() { }
    
    public func runTests(testClass:AnyClass) {
        
        let tests = testClass as! XCTestCase.Type
        let testSuite = tests.defaultTestSuite
        testSuite.run()
        let run = testSuite.testRun as! XCTestSuiteRun
        
        print("\nRan \(run.executionCount) tests in \(run.testDuration)s with \(run.totalFailureCount) failures")
    }
}

public func solution(_ A : inout [Int]) -> Int {
    
    if A.count < 3{
        return -1
    }
    
    var currentSingleMax = max(A[0], A[1])
    var currentSingleMin = min(A[0], A[1])
    
    var currentCoupleMax = A[0] * A[1]
    var currentCoupleMin = A[0] * A[1]
    
    var currentMaxProduct = A[0] * A[1] * A[2]
    
    for i in 2..<A.count {
        
        let value = A[i]
        
        // Product
        currentMaxProduct = max(currentCoupleMax * value,
                                currentCoupleMin * value,
                                currentMaxProduct
        )
        
        // Couple
        currentCoupleMax = max(currentSingleMax * value,
                               currentSingleMin * value,
                               currentCoupleMax
        )
        currentCoupleMin = min(currentSingleMin * value,
                               currentSingleMax * value,
                               currentCoupleMin
        )
        
        
        // Single
        currentSingleMax = max(value, currentSingleMax)
        currentSingleMin = min(value, currentSingleMin)
    }
    
    return currentMaxProduct
}

TestRunner().runTests(testClass: Tests.self)

