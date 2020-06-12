// Compute number of distinct values in an array.

import PlaygroundSupport
import XCTest

class Tests: XCTestCase {
    
    func testEmpty() {
        var a: [Int] = []
        let actual = solution(&a)
        let expected = 0
        XCTAssertEqual(actual, expected)
    }
    
    func testOneElement() {
        var a = [9]
        let actual = solution(&a)
        let expected = 1
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
    
    var set: Set<Int> = []
    
    for item in A {
        set.insert(item)
    }
    
    return set.count
}

TestRunner().runTests(testClass: Tests.self)

