//
//  TableDataSource.swift
//  delegation
//
//  Created by Luat on 6/2/21.
//

import UIKit


class TableDataSource: NSObject, UITableViewDataSource {
    var models: [String]
    
    init(models: [String]) {
        self.models = models
    }
    
    func updateData(models: [String]) {
        self.models = models
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = models[indexPath.row]
        return cell
    }
}
