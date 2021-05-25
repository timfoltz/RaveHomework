import UIKit



enum TemperatureRawValue: String {
    case kelvin
    case celcius
    case fahrenheit
}
let fahren = TemperatureRawValue.fahrenheit

enum TemperatureAssoc {
    case kelvin(String)
    case celcius(Int)
    case fahrenheit(Int)
    var assocValue: String {
        get {
            switch self {
            case .fahrenheit(let tempF): return String(tempF)
            case .celcius(let tempC): return String(tempC)
            case .kelvin(let tempK): return tempK
            }
        }
    }
    func getTempC() -> Int {
        return 0
    }
}
let fahrenAssoc = TemperatureAssoc.fahrenheit(70)
switch fahrenAssoc {
case .fahrenheit(let tempF): print(tempF)
case .celcius: print("no one uses that")
case .kelvin: print("no one uses that")
}

fahrenAssoc.assocValue


enum TemperatureMaybe {
    case kelvin, celsius, fahrenheit
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .kelvin
        case "C":
            self = .celsius
        case "F":
            self = .fahrenheit
        default:
            return nil
        }
    }
}

let tempUnit = TemperatureMaybe(symbol: "K")
tempUnit?.hashValue




protocol CheckID {
    var hasID: Bool { get }
    var isOldEnough: Bool { get }
    func isValid() -> Bool
}

class CollegeStudent {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Freshmen: CollegeStudent, CheckID {
    func isValid() -> Bool {
        return false
    }
    
    var hasID: Bool = true
    var isOldEnough: Bool = false
    
}

class Senior: CollegeStudent, CheckID {
    func isValid() -> Bool {
        return hasID && isOldEnough
    }
    
    var hasID: Bool = true
    var isOldEnough: Bool = true
}

struct Club {
    var customers: [CheckID] = [
        Freshmen(name: "Harry"),
        Senior(name: "Potter")
    ]
    
    func validateCustomers() -> [CheckID] {
        customers.filter { $0.isValid() }
//        return customers.filter { person in
//            if let casted = person as? Freshmen {
//                return casted.hasID && casted.isOldEnough
//            } else if let casted = person as? Senior {
//                return casted.hasID && casted.isOldEnough
//            } else {
//                return false
//            }
//        }
        
    }
    
}
var club = Club()
club.validateCustomers()



protocol Displayable {
    var title: String? { get }
    var subtitle: String { get }
    var imageURL: String { get }
    
    func getBlankTitle() -> String
}


struct ProductItem: Displayable {
    var title: String?
    var subtitle: String
    var imageURL: String
    func getBlankTitle() -> String {
        return "Product title"
    }
}
struct UserDetails: Displayable {
    var title: String?
    var subtitle: String
    var imageURL: String
    func getBlankTitle() -> String {
        return "User name title"
    }
}

class Displayer {
    var thingsToDisplay: [Displayable] = [
        UserDetails(title: "Luke", subtitle: "iOS Dev", imageURL: "https://www.com"),
        ProductItem(title: "MacBook Pro", subtitle: "M1 2020", imageURL: "https://www.com")
    ]
    
    func displayAllDisplayables() {
        for thing in thingsToDisplay {
            if let title = thing.title {
                print("\(title) \(thing.subtitle) \(thing.imageURL)")
            } else {
                print("\(thing.getBlankTitle()) \(thing.subtitle) \(thing.imageURL)")
            }
        }
    }
}

let displayer = Displayer()
displayer.displayAllDisplayables()
