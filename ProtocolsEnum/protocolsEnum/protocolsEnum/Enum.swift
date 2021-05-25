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
enum Temperature {
    case fahrenheit(Int)
    case celcius(Int)
    case kelvin(Int)
}


protocol GetFarhenheit {
    func getTempInFahrenheit() -> Int
    var tempInFahren: Int { get }
}
