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
    var viewModel: CellViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(viewModel: CellViewModel?) {
        self.viewModel = viewModel
//        print(viewModel?.drinkItem.strDrink)
        
    }
}
