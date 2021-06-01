//
//  ViewController.swift
//  tableView
//
//  Created by Luat on 5/28/21.
//

import UIKit

class ViewController: UITableViewController {

    let urlAddress = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=Vodka"
    var model: DrinkModel? {
<<<<<<< HEAD
        // Property observer: is trigged when new value is setr
=======
>>>>>>> d91f60f8ed264191c63e32bf11915834841a88d7
        didSet {
            dataSource.model = model
            ImageCache.shared.downloadAllImages(for: model)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    var dataSource = DrinkDataSource()
    var delegate = DrinkDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        getData()
    }
    
    func configureTableView() {
        let nib = UINib(nibName: DrinkCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: DrinkCell.identifier)
        tableView.dataSource = dataSource
        tableView.delegate = delegate
    }
    
<<<<<<< HEAD
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return model?.drinks.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt  indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DrinkCell.identifier, for: indexPath) as? DrinkCell
        else { return UITableViewCell() }
        let drinkItem = model?.drinks[indexPath.row]
        cell.configure(drinkItem: drinkItem)
        return cell
    }
    
    
=======
>>>>>>> d91f60f8ed264191c63e32bf11915834841a88d7
    func getData() {
        DrinkAPIManager.shared.setURLResource(urlString: urlAddress)
        DrinkAPIManager.shared.getDataParseJSON { decodedModel in
            self.model = decodedModel
        }
    }
}
