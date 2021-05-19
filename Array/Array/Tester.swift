//
//  Tester.swift
//  Array
//
//  Created by Luat on 5/19/21.
//

import Foundation

class Tester {
    static let shared = Tester()
    
    // MARK: - QUESTIONS
    /// 1. Write a function that takes an array of numbers and returns an array with each of the numbers multiplied by 2
    func multiplyByTwo(numbers original: [Int]) -> [Int]{

      return []
    }

    /// 2. Write a function to return the last half of the array, not including the median
    func lastHalf(array: [Int]) -> [Int] {
        return []
    }

    /// 3. Write a function that can creates an array populated with integers going from start (input) to end (input)
    func createArray(from start: Int, to end: Int) -> [Int] {
      return []
    }


    /// 5. Create this 2-D array
    /*
        [[1,2,3],
        [4,5,6],
        [7,8,9]]
     */
    func create2DArray() -> [[Int]] {
      return []
    }

    /// 6. Write a function that returns the number of pairs of elements that sums up to 0
    /// Input [1,2,3,-1,-2,-4] -> Output 2
    func findPairs(nums: [Int]) -> Int {

      return 0
    }

    //  "hello world"  -> "ellohay orldway"
    func printPigLatinSentence(sentence: String) -> String {

        return ""
    }
    
    func positionOf(character: Character, in word: String) -> [Int] {

        return []
    }
    
    /*
        Input: array of character of "I" and "O"
        - "I" -> increase number of chairs required
        - "O" -> decrease number of chairs required
        Output: max chairs required
     */
    func minimumChairs(array: [Character]) -> Int {
        return 0
    }
    
    /** Find the best day to first BUY and then a day occuring after that day to SELL. Return the maximum profit ( buy price - sell price)
        var prices = [7,1,5,3,6,4]  //returns 5
     */
    func maxProfit(array: [Int]) -> Int {
        
        return 0
    }
    
    /**
        Input: array of priorities: [1, 4, 8, 4]
        Output: reduce the distance bettwen priorities but keep the same priority ordering
            -> [1, 2, 3, 2]
     */
    func reduceDistanceKeepPriority(array: [Int]) -> [Int] {
        
        return []
    }
}
