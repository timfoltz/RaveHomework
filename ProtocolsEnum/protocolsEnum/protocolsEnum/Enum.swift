//
//  Enum.swift
//  protocolsEnum
//
//  Created by Luat on 5/25/21.
//

import Foundation


/**
 Start Here
 1) Have Temperature Enum Adopt the GetFarhenheit protocol
 2) Implement getTempInFarnheit func
 3) Implement tempInFahren property
 -- All test values are int
*/

enum Temperature: GetFarhenheit {
    func getTempInFahrenheit() -> Int {
        switch self {
        case .fahrenheit(let tempF):
            return tempF
        case .celcius(let tempC):
            //calc from C to F
        return (tempC * 9/5) + 32
        case .kelvin(let tempK):
            //calc K to F
            return (tempK - Int(273.15)) * 9/5 + 32
        }
    }
    
    var tempInFahren: Int { get {self.getTempInFahrenheit()} }
    
    case fahrenheit(Int)
    case celcius(Int)
    case kelvin(Int)
}

protocol GetFarhenheit {
    func getTempInFahrenheit() -> Int
    var tempInFahren: Int { get }
}
