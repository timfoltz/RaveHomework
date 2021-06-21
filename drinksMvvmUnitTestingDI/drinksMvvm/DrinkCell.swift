//
//  DrinkCell.swift
//  drinksMvvm
//
//  Created by Luat on 6/15/21.
//

import UIKit

class DrinkCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    
    static let identifier = "DrinkCell"
    var viewModel: CellViewModel? {
        didSet {
            DispatchQueue.main.async {
                self.nameLabel.text = self.viewModel?.drinkItem.drinkName
                self.idLabel.text = self.viewModel?.drinkItem.idDrink
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func configure(viewModel: CellViewModel?) {
        self.viewModel = viewModel
    }
}
