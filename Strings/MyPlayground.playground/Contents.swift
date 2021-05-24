import UIKit

// let is constant, can't not change
// var can be changed

let char: Character = "a"
let string: String = "aa"
//let myCastedChar = Character(string)
//if char == string {
//
//}
for char in string {
    print(char)
//    let myString = String(char)
}

for (index, value) in string.enumerated() {
    print("Position: \(index) Char: \(value)")
    print("Position:" + String(value))
    print("Position:" + String(index))
    print("Postion:" + "0")
//    let zero = "0"
//    let optionalNum = Int(zero)
//    if optionalNum == 0 {
//
//    }
}

for num in 0...5 {
    if num % 2 == 0 {
        continue
    } else if num == 3 {
        break
    }
    num > 0 ? print("true") : print("false")
    print(num)
}

for num in stride(from: 10, to: 0, by: -1) {
    print(num)
}

let greeting = "Hello😅✝️₴" //count is 5
print(greeting.count)
let myStartIndex = greeting.startIndex
greeting[myStartIndex] // "H"
for i in 0..<greeting.count {
// i => 0, 1, 2, 3, 4
    let myOffsetIndex = greeting.index(myStartIndex, offsetBy: i)
    print(greeting[myOffsetIndex])

    let currentChar = greeting[myOffsetIndex]
    if currentChar == "l" {
        
    }
}
greeting[myStartIndex]  // H
let myOffsetIndex = greeting.index(myStartIndex, offsetBy: 3)
print(greeting[myOffsetIndex])
//greeting[myStartIndex + 3]

greeting.replacingOccurrences(of: "e", with: "o")
let new = greeting.replacingCharacters(in: greeting.startIndex..<greeting.index(after: greeting.startIndex), with: "ab")
print(new, "changed")

print(greeting[greeting.startIndex...greeting.index(after: greeting.startIndex)] == new)



