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
    
    func getData() {
        DrinkAPIManager.shared.setURLResource(urlString: urlAddress)
        DrinkAPIManager.shared.getDataParseJSON { decodedModel in
            self.model = decodedModel
        }
    }
}
