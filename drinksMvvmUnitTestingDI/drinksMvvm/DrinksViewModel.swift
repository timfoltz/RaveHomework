//
//  DrinksViewModel.swift
//  drinksMvvm
//
//  Created by Luat on 6/15/21.
//

import Foundation


class DrinksViewModel {
    let urlAddress = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=rum"
    let drinksAPIService: APIServiceProtocol?
    
    var model: DrinkModel? {
        didSet {
            updateUI?()
        }
    }
    
    var customErrorMessage: String? {
        didSet {
            print("ERRROOORR \(customErrorMessage!)")
        }
    }
    
    init(apiService: APIServiceProtocol? = DrinksAPIService()) {
        self.drinksAPIService = apiService
        initFetch()
    }
    
    var updateUI: (() -> Void)?
    
    var rowCount: Int? {
        get {
            model?.drinks.count
        }
    }
    
    func initFetch() {
        self.drinksAPIService?.fetchDrinks(address: urlAddress, completion: { result in
            switch result {
            case .success(let drinkModel):
                self.model = drinkModel
            case .failure(let apiError):
                print("failure \(apiError)")
                self.customErrorMessage = apiError.rawValue
            }
        })
    }
    
    func createCellViewModel(for row: Int) -> CellViewModel? {
        if let drinkItem = model?.drinks[row] {
            let cellViewModel = CellViewModel(model: drinkItem)
            return cellViewModel
        }
        return nil
    }
}
