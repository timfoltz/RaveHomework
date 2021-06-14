//
//  ColumnLayout.swift
//  cellSizes
//
//  Created by Luat on 6/14/21.
//


import UIKit

class ColumnLayout: UICollectionViewFlowLayout {
    
    override func prepare() {
        super.prepare()
        print("calling prepare")
        guard let cv = collectionView else { return }
        
        let availableWidth = cv.bounds.size.width
        var numberOfItems: CGFloat = 2.0
        let leftRightMargin: CGFloat = 20.0
        
        if cv.bounds.width > 500 {
            numberOfItems = 4.0
        }
        
        let itemWidth = (availableWidth - leftRightMargin - self.minimumInteritemSpacing * (numberOfItems - 1)) / numberOfItems
        
        self.itemSize = CGSize(width: itemWidth, height: itemWidth)
        
        self.sectionInset = UIEdgeInsets(top: self.minimumLineSpacing, left: 10, bottom: 0, right: 10)
        
    }
}
