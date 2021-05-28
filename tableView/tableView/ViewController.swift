//
//  ViewController.swift
//  tableView
//
//  Created by Luat on 5/28/21.
//

import UIKit

class ViewController: UITableViewController {

    let urlAddress = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Gin"
    var model: DrinkModel? {
        // Property observer: is trigged when new value is set
        didSet {
            // update the UI
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
//    var fakeData = [
//        "first",
//        "second",
//        "third"
//    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        getData()
//        tableView.dataSource = self    //implicitly set
//        print(model, "viewDidLoad: printing model")
    }
    
    func configureTableView() {
        let nib = UINib(nibName: DrinkCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: DrinkCell.identifier)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return model?.drinks.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DrinkCell.identifier, for: indexPath) as? DrinkCell
        else { return UITableViewCell() }
        let drinkItem = model?.drinks[indexPath.row]
        cell.configure(drinkItem: drinkItem)
        return cell
    }
    
    
    func getData() {
        let url = URL(string: urlAddress)!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            do {
                let decodedDrinks = try JSONDecoder().decode(DrinkModel.self, from: data)
                self.model = decodedDrinks
            } catch (let error) {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }

}

