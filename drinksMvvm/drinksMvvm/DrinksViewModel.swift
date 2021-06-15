//
//  DrinksViewModel.swift
//  drinksMvvm
//
//  Created by Luat on 6/15/21.
//

import Foundation


class DrinksViewModel {
    var urlAddress = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic"
    var model: DrinkModel? {
        didSet {
            updateUI?()
        }
    }
    
    init() {
        fetchDrinks()
    }
    
    var updateUI: (() -> Void)?
    
    var rowCount: Int? {
        get {
            model?.drinks.count
        }
    }
    
    func createCellViewModel(for row: Int) -> CellViewModel? {
        if let drinkItem = model?.drinks[row] {
            let cellViewModel = CellViewModel(model: drinkItem)
            return cellViewModel
        }
        return nil
    }
    
    func fetchDrinks() {
        let url = URL(string: urlAddress)!
        URLSession.shared.dataTask(with: url) { (data, reponse, error) in
            guard let data = data else {
                print("error downloading")
                return
            }
            do {
                let decoded = try JSONDecoder().decode(DrinkModel.self, from: data)
                self.model = decoded
            } catch {
                print("error decoding", error)
            }
        }.resume()
        
    }
    
    
    
}
