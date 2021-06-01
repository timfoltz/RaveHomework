//
//  DrinkDataSource.swift
//  tableView
//
//  Created by Luat on 5/31/21.
//

import UIKit

class DrinkDataSource: NSObject, UITableViewDataSource {
    var model: DrinkModel?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model?.drinks.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DrinkCell.identifier, for: indexPath) as? DrinkCell
        else { return UITableViewCell() }
        
        let drinkItem = model?.drinks[indexPath.row]
        cell.configure(drinkItem: drinkItem)
        
        ImageCache.shared.loadImage(from: drinkItem!.imageURL) { image in
            if let visibleCell = tableView.cellForRow(at: indexPath) as? DrinkCell {
                visibleCell.drinkView.image = image
            }
        }
        
        return cell
    }
}

class DrinkDelegate: NSObject, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 280
    }
}
