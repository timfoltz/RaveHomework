//
//  drinksMvvmTests.swift
//  drinksMvvmTests
//
//  Created by Luat on 6/17/21.
//

import XCTest
@testable import drinksMvvm

class drinksMvvmTests: XCTestCase {
    
    var mockService: MockAPIService!
    var sut: DrinksViewModel!

    override func setUp() {
        mockService = MockAPIService()
        sut = DrinksViewModel(apiService: mockService)
    }
    
    override func tearDown() {
        mockService = nil
        sut = nil
        super.tearDown()
    }
    
    func testCreateCellViewModel() {
        var drinks: [DrinkItem] = []
        for num in 0...5 {
            let model = DrinkItem(drinkName: "Long Island \(num)",
                                  imageUrl: "longIsland.jpeg",
                                  idDrink: "999\(num)")
            drinks.append(model)
        }
        sut.model = DrinkModel(drinks: drinks)
        
        let cellViewModel = sut.createCellViewModel(for: 5)
        
        XCTAssertEqual("Long Island 5", cellViewModel?.drinkItem.drinkName, "Created model should have expected name Long Island 5")
        
    }
    func testCreateCellViewModelFail() {
        sut.model = nil
        let cellViewModel = sut.createCellViewModel(for: 2)
        
        XCTAssertNil(cellViewModel, "Test model should not be created from nil DrinkModel")
    }

    func testDrinksViewModelSuccess() {
        /// Testing Network calls
        /// 1) expect = expectation() 2) expect.fulfill 3) Assert
        let expect = expectation(description: "fetch Drink should get drinks array of count 1")
        var count = 0
        
        sut.drinksAPIService?.fetchDrinks(address: "FakeAddress") { result in
            if case .success(let drinkModel) = result {
                count = drinkModel?.drinks.count ?? 0
            }
            expect.fulfill()
        }
        
        wait(for: [expect], timeout: 5)
        XCTAssertEqual(count, 1, "Count with mock data should be 1")
    }
    
    func testDrinksViewModel() {
        let myError = APIError.invalidURL.rawValue
        mockService.failWithError = .invalidURL
        
        sut.initFetch()
        
        XCTAssertEqual(myError, sut.customErrorMessage, "new error should be populated")
    }
  
}

class MockAPIService: APIServiceProtocol {
    
    var failWithError: APIError?
    
    func fetchDrinks(address: String, completion: @escaping (Result<DrinkModel?, APIError>) -> Void) {
        
        switch failWithError {
        case nil:
            let drinkModel = DrinkModel(drinks: [
                    DrinkItem(drinkName: "name",
                              imageUrl: "image",
                              idDrink: "iD")
                ])
                completion(.success(drinkModel))
        case .invalidURL:
            completion(.failure(.invalidURL))
        case .errorDecoding:
            completion(.failure(.errorDecoding))
        default:
            completion(.failure(.noData))
        }
    }
}
