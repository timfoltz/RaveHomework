import UIKit

let nums = [1,2,2,2,3]
var myNumsSet: Set<Int> = []
let empArry: [Int] = []
var empDictionary: [Int: Int] = [:]

for num in nums {
    myNumsSet.insert(num)
    if empDictionary[num] == nil {
        empDictionary[num] = 1
    } else {
        // force unwrapping
        empDictionary[num]! += 1
//        var value = empDictionary[num] // returns Int?
//        value = value + 1
    }
}
print(myNumsSet)
let mySortedSet = myNumsSet.sorted(by: { (firstEle, secondEle) in
    return firstEle < secondEle
})
print(mySortedSet)
print(empDictionary)

let mySortedDict = empDictionary.sorted(by: { (tuple, tuple2) in
    tuple.key < tuple2.key
})
print(mySortedDict)

let myTuple = (4, "42", 9, 19)
myTuple.0
myTuple.1

var nilInt: Int?
var optInt: Int? = 9
var normalInt: Int = 9
var optString: String? = "10"

//print(nilInt)
//optInt = nil
normalInt = 19
//normalInt = nil


if optInt == nil {
    print("nothing")
} else {
    print(optInt!)
}

if optInt != nil {
    let value = optInt!
    print(value)
}

let myIntFromStringNil = Int("fifty")  // -> Int?
let myIntFromString = Int("10")        // -> Int?
print(myIntFromStringNil, "should be nil")
print(myIntFromString)

// Todo:
if myIntFromString == 10 {
    print("here")
}

//1) Optional binding: guard let
//guard 6 % 2 == 0 else { fatalError("breaks") }
//print("6 is even")
guard let value = myIntFromString else { fatalError("error") }
print(value)
//guard user.isLoggedIn == true else { returnToHome() }

//2) Optional binding: if let
var tempValue: Int
if let value = optInt {
    print(value)
}

let realInt: Int = Int(optString!)!
print(realInt)

if let realString = optString, let realIntUnwrapped = Int(realString) {
    print(realIntUnwrapped, "unwrapped")
}

//3) nil coalescing
var realString = optString ?? "default: opt string is nil"
// same as
if optString != nil {
    realString = optString!
} else {
    realString = "default"
}
print(realString, "optString unwrapped")

// 4) Optional chaining
class Person {
    var name: String
    var city: Location?
    init(name: String, city: Location) {
        self.name = name
        self.city = city
    }
}
class Location {
    var name: String
    init(name: String) {
        self.name = name
    }
    func description() -> String {
        return "name: \(name)"
    }
}
var city: Location = Location(name: "philly")
var person: Person? = Person(name: "Luke", city: city)
//person = nil
let myName = person?.name
print("optional chaining: ", myName)
print("city ", (person?.city?.name)!)

// 5) force unwrap
let unwrapped = optInt!

// 6) implicit unwrap
let implicit: Int! = 10
print("implicit type", implicit)

let newImplicit: Int = implicit
print("implicit unwrap", newImplicit)
//implicit = nil
//let newImplicit2: Int = implicit

///
var nestedDict: [Int?:[Int?]?] = [:]
nestedDict[10] = [99]
nestedDict[nil] = [5]
print("nil key, value: ", nestedDict[nil])
print(nestedDict)
print("triple optional", nestedDict[10])
print("=====")
if let valueArr = nestedDict[10] {
    print("value arr ", valueArr)
    if let nestedValue = valueArr {
        print("nested value", nestedValue)
        if let doubleNested = nestedValue[0] {
            print("doubleNested ", doubleNested)
        }
    }
}

let stringTen = "10"
let intFromString = Int(stringTen)

let num: Int = 10
if intFromString == num {
    print("this is not suppose to work")
}









//switch optInt {
//case .none:
//    print("nothing")
//case .some(let value):
//    print(value)
//}
