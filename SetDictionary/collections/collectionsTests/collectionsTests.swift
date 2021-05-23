//
//  collectionsTests.swift
//  collectionsTests
//
//  Created by Luat on 5/20/21.
//

import XCTest
@testable import collections

class collectionsTests: XCTestCase {

    let tester = Tester()
    
    func testRemoveDups() {
        let input = [1, 1, 2, 2, 3]
        let expected: Set<Int> = [1, 2, 3]
        
        let result = tester.removeDups(nums: input)

        XCTAssert(expected == Set(result), "\n Result: \(result) \n Expected: \(expected)")
    }
    
    func testCommonNums() {
        let firstInput = [1, 2, 3, 10]
        let secondInput = [1, 2, 3, 8]
        let expected: Set<Int> = [1, 2, 3]
        
        let result = tester.findCommonNums(from: firstInput, and: secondInput)
        
        XCTAssert(expected == Set(result), "\n Result: \(result) \n Expected: \(expected)")
    }
    
    func testMatchingLetters() {
        let first = "hello"
        let second = "goodbye"
        let expected: Set<Character> = [
            "e", "o"
        ]
        
        let result = tester.findMatchingLetters(firstWord: first, secondWord: second)
        
        XCTAssert(expected == Set(result), "\n Result: \(result) \n Expected: \(expected)")
    }
    
    func testCreateCounter() {
        let input = "aa bb c"
        let expected: [Character: Int] = [
            "a": 2,
            "b": 2,
            "c": 1,
        ]
        
        let result = tester.createCounter(string: input)
        
        XCTAssert(expected == result, "\n Result: \(result) \n Expected: \(expected)")
    }
    
    func testMostFrequent() {
        let input = "aa bbb c"
        let expected: Character = "b"
        
        let result = tester.mostFrequentLetter(string: input)
        
        XCTAssert(expected == result, "\n Result: \(result) \n Expected: \(expected)")
    }
    
    
    
    func testFindPairs() throws {
        let input = [1, 2, 3, -1, -2, -4]
        let expected = 2
    
        let result = tester.findPairs(nums: input)
        
        XCTAssertEqual(result, expected, "\n Result: \"\(result)\" \n Expected: \"\(expected)\"")
    }
    
    /// Optionals: use if let (optional binding)
    func testUnwrapInt() throws {
        let input: Int? = 10
        let expected = 10
    
        let result = tester.unwrap(optional: input)
        
        XCTAssertEqual(result, expected, "\n Result: \"\(result)\" \n Expected: \"\(expected)\"")
    }
    
    /// Optionals: use guard let (optional binding)
    func testUnwrapString() throws {
        let input: String? = "10"
        let expected = "10"
    
        let result = tester.unwrap(optional: input)
        
        XCTAssertEqual(result, expected, "\n Result: \"\(result)\" \n Expected: \"\(expected)\"")
    }
    
    /// Optionals: use nil coalescing
    func testUnwrapArray() throws {
        let input: [Int]? = [10]
        let expected = 10
    
        let result = tester.unwrap(optional: input)
        
        XCTAssertEqual(result, expected, "\n Result: \"\(result)\" \n Expected: \"\(expected)\"")
    }
    
    /// Optionals: use nil coalescing
    func testUnwrapDictionary() throws {
        let input: [Int: Int]? = [1: 100,3:200,5:20]
        let expected = 20
    
        let result = tester.unwrap(optional: input, key: 5)
        
        XCTAssertEqual(result, expected, "\n Result: \"\(result)\" \n Expected: \"\(expected)\"")
    }
    
    /// Optionals: use optional chaining and optional binding
    func testUnwrapNestedArray() throws {
        let input: [[Int]?]? = [[100]]
        let expected = 100
    
        let result = tester.unwrap(optional: input)
        
        XCTAssertEqual(result, expected, "\n Result: \"\(result)\" \n Expected: \"\(expected)\"")
    }
    
    /// Optionals: use implicit unwrap
    func testImplicitUnwrap() throws {
        let input: Int? = 9
        let expected = 9
    
        let result = tester.implicitUnwrap(optional: input)
        
        XCTAssertEqual(result, expected, "\n Result: \"\(result)\" \n Expected: \"\(expected)\"")
    }

}
