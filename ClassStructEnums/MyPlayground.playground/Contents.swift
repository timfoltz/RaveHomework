import UIKit


/**
 Same:
 1) Both can have properties, functions
 2) Initializers
 
 Differences:
 1) Struct has free memberwise init
 2) Class are reference type, structs are value type
    - value types are immutable, unless you state mutating func
    - Struct/Value type: any changes will create a new instance (copying to new variable)
 3) Only class can have inheritance
 4) Only class have deinitializer
 5) Memory management: ARC: automatic reference counting
 
*/
class ClassCity {
    var name: String
    var pop: Int?
    init() {
        self.name = "no name"
    }
    init(name: String) {
        self.name = name
    }
    init(name: String, pop: Int) {
        self.name = name
        self.pop = pop
    }
    func printName() {
        print(name)
    }
    func changeName(to name: String) {
        self.name = name
    }
    deinit {
        print("deallocating memory")

    }
}

class SubCity: ClassCity {
    var mayor: String?
    override init() {
        super.init()
    }
}

struct StructCity {
    var name: String
    var pop: Int?
    
//    init(name: String) {
//        self.name
//
//    }
// Auto generated member-wise initializer
//    init(name: String, pop: Int) {
//        self.name = name
//        self.pop = pop
//    }
    
    func printName() {
        print(name)
    }
    mutating func changeName(to name: String) {
        self.name = name
    }
//    deinit {
//        print("shouldn't")
//    }
}
//struct SubStructCity: StructCity {
//
//}

var structParis = StructCity(name: "Paris, Texas", pop: 100)
structParis.name
structParis.name = "new name"
structParis.name

var classLondon = ClassCity(name: "London")

var secondLondon = classLondon
secondLondon.name = "Second London"
classLondon.name
secondLondon.name


var secondStructParis = structParis
secondStructParis.name = "second Paris"
structParis.name
secondStructParis.name

var smallLondon = SubCity()
smallLondon.name
smallLondon.name = "This name"
smallLondon.name

classLondon.printName()
structParis.printName()

classLondon.changeName(to: "fake london")
structParis.changeName(to: "fake paris")
classLondon.name
structParis.name

let newCity = ClassCity(name: "Let city")
newCity.name = "New Let city name"

//newCity = ClassCity(name: "next city")

var newStructCity = StructCity(name: "Let struct city", pop: nil)
newStructCity.name = "new let struct city"


class State {
    weak var country: Country?
    func coolFunc() {}
    deinit {
        print("de allocating memory \(country?.state)")
    }
}
class Country {
    var state: State?
    
    deinit {
        print("de allocating memory")
    }
}
var unitedStates: Country? = Country() // ARC-US: 1
var texas: State? = State()
unitedStates?.state = texas
texas?.country = unitedStates // ARC-US: 1
// strong reference cycle, memory cycle, retain cycle
texas = nil
unitedStates = nil // ARC-US: 1


class MemoryLeak {
    var name: String = "Name"
    lazy var updateMyName: (String) -> Void = { [weak self] myName in
        self?.name = myName
    }
    
    deinit {
        print("mem leak de init")
    }
}
var memLeakInstance: MemoryLeak? = MemoryLeak()
//memLeakInstance?.updateMyName("new name")
memLeakInstance?.name
memLeakInstance = nil
