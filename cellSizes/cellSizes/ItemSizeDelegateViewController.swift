//
//  ItemSizeViewController.swift
//  cellSizes
//
//  Created by Luat on 6/14/21.
//

import UIKit

class ItemSizeDelegateViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    func setupCollectionView() {
        let nib = UINib(nibName: NameCell.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: NameCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }

}

// MARK: - Item Size

extension ItemSizeDelegateViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 250)
    }
}


// MARK: - DataSource

extension ItemSizeDelegateViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return globalDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NameCell.identifier, for: indexPath) as? NameCell else {
            return UICollectionViewCell()
        }
        
        cell.nameLabel.text = globalDataSource[indexPath.row]
        
        return cell
    }
}
