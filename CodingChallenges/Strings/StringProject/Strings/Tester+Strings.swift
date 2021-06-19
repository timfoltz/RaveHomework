//
//  Tester+Strings.swift
//  Day1-BasicTypes
//
//  Created by Luat on 5/16/21.
//

import Foundation

extension Tester {

    func printWord(word: String) {
    }
    
    func printUpperCase(word: String) {
        print(word.uppercased())
    }
    
    func printLetters(word: String) {
        for x in word {
            print(x)
        }
    }
    
    func printEveryOtherLetter(word: String) {
        for (index, value) in word.enumerated() {
            if index % 2 == 0 {
                print(value)
            }
        }
        
    }
    
    func isPalindrome(word: String) -> Bool {
        let len = word.count/2
        for i in 0..<len {
            let start = word.index(word.startIndex, offsetBy: i)
            let end = word.index(word.endIndex, offsetBy: (-i) - 1)
            if word[start] != word[end] {
                return false
            }
//            word[word.endIndex] // out of bounds
//            word[count - 1] // can't use Int as subscript
            let lastIndex = word.index(word.endIndex, offsetBy: -1)
//            let lastIndexTwo = word.index(before: word.endIndex)
            print(word[lastIndex])
            
        }
        return true
    }
    
/*
    Pig Latin:
    1) Move the first letter to the end and add "ay"
        pig -> igpay
        latin -> atinay
    2) IF word starts with a vowel, add "yay" to the word
        one -> oneyay
*/
    func printPigLatin(word: String) {
        let vowels = "aeiou"
        if vowels.contains(word[word.startIndex]) {
            print(word + "yay")
        } else {
            print(word.dropFirst() + word.prefix(1) + "ay")
        }
//        let testPrefixNeg = word.prefix(-1)
//        print(testPrefixNeg)
    }
}
