// Compute the number of intersections in a sequence of discs.

import PlaygroundSupport
import XCTest

class Tests: XCTestCase {
    
    func testGiven() {
        var a = [1, 5, 2, 1, 4, 0]
        let actual = solution(&a)
        let expected = 11
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
    
    let c = A.count
    var starts = Array(repeating: 0, count: c)
    var ends = Array(repeating: 0, count: c)
    
    for (index,value) in A.enumerated(){
        let s = value > index ? 0 : index - value
        let e = (c - 1) > index + value ? index + value : (c - 1)
        
        starts[s] += 1
        ends[e] += 1
    }
    
    var result = 0
    var live = 0
    for i in 0..<c {
        if starts[i] > 0 {
            result += starts[i] * live
            result += starts[i] * (starts[i] - 1) / 2
            if 10000000 < result {
                return -1
            }
            live += starts[i]
        }
        live -= ends[i]
    }
    return result
}

TestRunner().runTests(testClass: Tests.self)

