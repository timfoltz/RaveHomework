//
//  MusicCell.swift
//  viewControllApp
//
//  Created by Luat on 6/1/21.
//

import UIKit

class MusicCell: UITableViewCell {

    static let identifier = "MusicCell"
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    
    @IBOutlet weak var musicImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Setup the view here
    }

    func configure() {
        
    }
    // Todo: create ImageDownloader class, and cache image
}
