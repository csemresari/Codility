// Determine whether a triangle can be built from a given set of edges.

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
        let expected = 0
        XCTAssertEqual(actual, expected)
    }
    
    func testTwoElement() {
        var a = [9, 4]
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
    
    func testGiven() {
        var a = [10, 2, 5, 1, 8, 20]
        let actual = solution(&a)
        let expected = 1
        XCTAssertEqual(actual, expected)
    }
    
    func testHugeNumbers() {
        var a = [ 2147483648, 2147483646, 2147483645]
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
    
    if A.count < 3 {
        return 0
    }
    
    let list = A.sorted()
    
    for i in 0..<list.count-2 {
        
        let A = list[i]
        let B = list[i+1]
        let C = list[i+2]
        
        if A > C - B && B > A - C && C > B - A {
            return 1
        }
    }
    
    return 0
}

TestRunner().runTests(testClass: Tests.self)

