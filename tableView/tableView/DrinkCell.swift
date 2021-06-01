//
//  DrinkCell.swift
//  tableView
//
//  Created by Luat on 5/28/21.
//

import UIKit

class DrinkCell: UITableViewCell {
    
    static let identifier = "DrinkCell"
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var drinkView: UIImageView!
    
    func configure(drinkItem: DrinkItem?) {
        topLabel.numberOfLines = 0
        topLabel.text = drinkItem?.name
        bottomLabel.text = drinkItem?.idDrink
//        let urlString = drinkItem?.imageURL
//        setImage(urlString: urlString)
//        getImageFromCache(urlString: urlString!)
    }
    
    func setImage(urlString: String?) {
        self.drinkView?.image = nil
        if let urlString = urlString,
           let url = URL(string: urlString) {
            DispatchQueue.global().async {
                URLSession.shared.dataTask(with: url) { (data, resp, error) in
                    if let data = data {
                        let image = UIImage(data: data)
                        DispatchQueue.main.async {
                            self.drinkView.image = image
                        }
                    }
                }.resume()
            }
        }
    }
    
    func getImageFromCache(urlString: String) {
        ImageCache.shared.loadImage(from: urlString) { image in
            self.drinkView.image = image
        }
    }
    
}
