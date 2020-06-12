// Count the number of passing cars on the road.

import PlaygroundSupport
import XCTest

class Tests: XCTestCase {
    
    func testEmpty() {
        var a: [Int] = []
        let actual = solution(&a)
        let expected = -1
        XCTAssertEqual(actual, expected)
    }
    
    func testOneElement() {
        var a = [9]
        let actual = solution(&a)
        let expected = 0
        XCTAssertEqual(actual, expected)
    }
    
    func testMaxElement() {
        var a = [100000]
        let actual = solution(&a)
        let expected = 0
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
    
    if A.isEmpty {
        return -1
    }
    
    var zeros = 0
    var total = 0
    
    for value in A {
        
        if value == 0 {
            zeros += 1
        }else{
            total += zeros
        }
    }
    
    if total > 1000000000 {
        return -1
    }
    
    return total
}

TestRunner().runTests(testClass: Tests.self)

