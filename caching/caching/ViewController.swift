//
//  ViewController.swift
//  caching
//
//  Created by Luat on 6/4/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var model: DrinkModel? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    let diskManager = DiskCacheManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        fetchData()
//        try? diskManager.delete()
    }
    
    func fetchData() {
        // chech if data exist in cache
        if let data = diskManager.read() {
            if let model = try? JSONDecoder().decode(DrinkModel.self, from: data) {
                self.model = model
            }
        } else {
            APIClient.shared.downloadData { (model: DrinkModel?) in
                self.model = model
            }
        }
    }
    
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.drinks.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell() // shouldn't create new cell
        let drinkItem = model?.drinks[indexPath.row]
        cell.textLabel?.text = drinkItem?.name
        return cell
    }
    
    
}
