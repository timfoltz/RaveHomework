//
//  AvatarCell.swift
//  Avatar
//
//  Created by Luat on 6/6/21.
//

import UIKit

class AvatarCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var affiliationLabel: UILabel!
    
    func configure(model: Character) {
        nameLabel.text = model.getName()
        affiliationLabel.text = model.getAffiliation()
        backgroundColor = model.getColor()
    }
}
