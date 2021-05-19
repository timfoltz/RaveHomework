import UIKit

/// Int
let myNum = 4 //Int
// creating a double from an Int
let myDouble = Double(myNum) // creates 4.0 from 4

let dividedNum = myNum / 3 // 4/3 = 1
let dividedDouble = Double(myNum) / 3.0 // 4.0/3.0 = 1.3333

let intThree = 3
//let dividedDouble = Double(myNum) / intThree // can't do this

let remainder = myNum % 3
print(Int.max)
print("8", Int8.max) // 2^7 - 1
print("16", Int16.max)
print("32", Int32.max)
print("64", Int64.max)


/// Array
let firstArry: [Any] = [
    1,
    "2",
    [5.7],
]

var simple = [1, 2 , 3 , 4]

if type(of: simple) == [Int].self {
    print("this is true")
}
//simple.append(4.5)   // can't do this
//simple.append("7")
//let double: Double = 5.0
//print(Int.max)

for count in 0...3 {
    print(simple[count])
}

for anyNAME in simple {
    print(anyNAME)
}
print("==========")
let subArray = simple[2...3]
print(subArray)
print("element at index 2", subArray[2])
print("count", subArray.count)

for (index, value) in simple.enumerated() {
    print("First: \(index) Second: \(value)")
}

simple.append(5)
print("current count", simple.count)
print("current capacity", simple.capacity)
simple.append(6)
print("current count", simple.count)
print("current capacity", simple.capacity)
simple.append(7)
print("current count", simple.count)
print("current capacity", simple.capacity)
simple.append(8)
print("current count", simple.count)
print("current capacity", simple.capacity)
simple.append(9)
print("current count", simple.count)
print("current capacity", simple.capacity)

var createdArray = Array(repeating: 0, count: 3)
createdArray.append(19)
createdArray.append(contentsOf: [1,2,3])
print(createdArray)

// type of closure in map func type: (Element) -> Element
let mappedArray = createdArray.map({ value in
    return value * 2
})
/// same as above
/// 1)
var newArray: [Int] = []
for value in createdArray {
    newArray.append(value * 2)
}
/// 2)
let myClosure01: (Int) -> Int = { value in
    return value * 2
}
let mappedArray01 = createdArray.map(myClosure01)
/// 3)
let mappedArray02 = createdArray.map { $0 * 2 }

print(mappedArray02)

print(mappedArray)
print(newArray)


/// Functions
func myFunc(with input: Int) {
    print(input)
}

myFunc(with: 5)

// 1st label: external label
// 2nd label: internal label
// "parameter list"
func noParaName(_ input: Int) {
    print(input)
}
noParaName(8)

let myClosure: () -> Void = {
    print("in closure")
}

// calling myClosure
myClosure()
myClosure

// "Capture list": purpleUnicorn
let intClosure: (Int) -> Void = { purpleUnicorn in
    print(purpleUnicorn)
}
intClosure(10)

//let myDictionary: [String: String] = [:]


