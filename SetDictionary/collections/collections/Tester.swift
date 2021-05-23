//
//  Tester.swift
//  collections
//
//  Created by Luat on 5/20/21.
//

import Foundation

struct Tester {
    func removeDups(nums: [Int]) -> [Int] {
        var newNums = Array(Set(nums))
        return newNums
    }
    
    func findCommonNums(from firstNums: [Int], and secondNums: [Int]) -> [Int] {
        var returnArr: [Int] = []
        for num in firstNums {
            if returnArr.contains(num){
                continue
            }else if secondNums.contains(num) {
                returnArr.append(num)
            }
        }
        return returnArr
    }
    
    // first: "hello", second: "bye" -> ["e"]
    func findMatchingLetters(firstWord: String, secondWord: String) -> [Character] {
        var result: [Character] = []
        for char in firstWord {
            if secondWord.contains(char) {
                result.append(char)
            }
        }
        return result
    }
    
    
    // Count the letters, ignoring spaces
//    func createCounter(string: String) -> [Character: Int] {
//        var result: [Character:Int] = [:]
//        for char in string {
//            if char == " " {
//                continue
//            }
//            else if !result.keys.contains(char) {
//                result[char] = 1
//            } else {
//                result[char]! += 1
//            }
//        }
//        return result
//    }
    func createCounter(string: String) -> [Character: Int] {
        var result: [Character: Int] = [:]
        for ele in string {
            if result[ele] != nil {
                result[ele]! += 1
            } else if ele != " " {
                result[ele] = 1
            }
        }
        return result
    }
    
    // "hello there" -> "e"
    func mostFrequentLetter(string: String) -> Character {
        let resultDict = createCounter(string: string)
        let result = resultDict.first(where: {$0.value == resultDict.values.max()})
        return result!.key
    }
    
    // O(n) time
    func findPairs(nums: [Int]) -> Int {
        var count = 0
        var mySet: Set<Int> = []
        for ele in nums {
            mySet.insert(ele)
        }
        for ele in mySet {
            if mySet.contains(-ele){
                count += 1
                mySet.remove(ele)
                mySet.remove(-ele)
                print(mySet)
            }
        }
        
      return count
    }
    
    
    /// Optionals
    /// Unwrap using optional binding: if let
    func unwrap(optional: Int?) -> Int {
        if let unwrapped = optional {
            return unwrapped
        }
        return 0
    }
    
    /// Unwrap using optional binding: guard let
    func unwrap(optional: String?) -> String {
        guard let unwrapped = optional else{return "Nope"}
        return unwrapped
    }
    
    /// Unwrap using nil coalescing
    // takes optional array, return first value?
    func unwrap(optional: [Int]?) -> Int {
        let unwrapped = optional?.first ?? 0
            // ^^^ assign variable "unwrapped" if optional exists
            //          -> if optional exists get first value if first value exists
            //                          ?? = if niether optional or first value exists
            //                              ->set "unwrapped" to 0
        return unwrapped
    }
    
    /// Unwrap using nil coalescing
    // takes optional dictionary, return value at key?
    func unwrap(optional: [Int: Int]?, key: Int?) -> Int {
        let unwrappedKey = key ?? -1
        let unwrappedValue = optional?[unwrappedKey] ?? -1
        return unwrappedValue
    }
    
    /// Unwrap using optional chaining and optional binding
    // takes nested optional array, return first value?
    func unwrap(optional: [[Int]?]?) -> Int {
        if let unwrapped = optional?.first??.first {
            return unwrapped
        }
        return 0
    }
    
    /// Unwrap using implicitly unwrap
    func implicitUnwrap(optional: Int?) -> Int {
        let unwrapped: Int! = optional
        let implicit: Int = unwrapped
        return implicit
    }
    
}
