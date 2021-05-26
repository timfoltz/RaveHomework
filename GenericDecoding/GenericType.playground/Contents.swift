import UIKit


// Design Pattern: Singleton
class Singleton {
    private init() {}
    static var shared = Singleton()
    var userName = "Tom"
    
    func changeAge(ages: [Int], newAge: inout [Int]) -> [Int] {
        for age in ages {
            newAge.append(age)
        }
        return newAge
    }
}

Singleton.shared.userName
//Singleton.shared.changeUsername()
//var secondInstance = Singleton()
var myArray: [Int] = [1,2,3]
Singleton.shared.changeAge(ages: [1,2,3], newAge: &myArray)
myArray


let optional: [[Int]?]? = [[0]]
if let doublyNestedUnwrapped = optional,
   let firstSinglyWrapped = doublyNestedUnwrapped.first,
   let finalFirstElement = firstSinglyWrapped?.first {
    print(finalFirstElement)
}

if let unwrapped = optional?.first??.first?.hashValue {
    print(unwrapped)
}

let regOptional: Int? = 8
let forcedValue = regOptional!
let dividedForced = regOptional! / 1

let impOptional: Int! = 8
let divided = impOptional / 1
let impValue: Int = impOptional
print(impValue)


// Equatable, Comparable, Hashable, Codable

class InfoDetails {
    
    var name: String
    var price: Int
    
    init(name: String, price: Int) {
        self.name = name
        self.price = price
    }
}

/// Generics

class DataPresenter<MyType> {
    var name: String
    var price: MyType
    
    init(name: String, price: MyType) {
        self.name = name
        self.price = price
    }
    func getPrice() -> MyType {
        return price
    }
}

extension DataPresenter where MyType == Int {
    func getBit() -> MyType {
        return price
    }
}


let price: Int = 100
let firstData = DataPresenter(name: "iPod", price: price)
let firstValue = firstData.getPrice()
let secondData = DataPresenter(name: "iPhone", price: 1000.99)
let secondValue = secondData.getPrice()
//firstValue + secondValue

firstData.getBit()

let infoType = InfoDetails(name: "mac", price: 100)
let firstInfoType = DataPresenter(name: "iPod", price: infoType)

/*
let data = ({
    "name": "Tom"
    "age": "27"
}) --> Binary data

struct Person: Codable {
    let name: String
    let age: String
}

let decoder = JSONDecoder()
let fetchedPerson = decoder.decode(Person.self, from: data)
fetchedPerson.name
 */
