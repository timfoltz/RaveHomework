//
//  DelegationExample.swift
//  delegation
//
//  Created by Luat on 6/2/21.
//

import Foundation
// S Single reponsibility
// O Open-Close Principle: open to extensions and close to modification
// L liskow's subsitution: subclass should do what base class can
// I Interface segreation: the more the better
// D Dependency Inversion: depends on abstractions and not concrete implementations

// Abstract
protocol ShopperProtocol {
    func getIngredients() -> [String]
}

// Concrete
//class Shopper: ShopperProtocol {
//    func getIngredients() -> [String] {
//        return ["potato", "tomato"]
//    }
//}

class Chef {
    var ingredients: [String] = []
    var shopper: ShopperProtocol?
    
    func cook() {
        // needs getIngredients(), but don't want coupling
        if let shoppedIngredients = shopper?.getIngredients() {
            ingredients.append(contentsOf: shoppedIngredients)
        }
        
    }
}
