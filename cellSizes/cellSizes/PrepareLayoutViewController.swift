//
//  FlowLayoutSubclassViewController.swift
//  cellSizes
//
//  Created by Luat on 6/14/21.
//

import UIKit

class PrepareLayoutViewController: UIViewController {

    var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    /// CollectionView
    /* dataSource
       delegate: select and size
       layout: arranging the cell
     */
    func setupCollectionView() {
        let layout = ColumnLayout()
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(collectionView)
        collectionView.backgroundColor = .brown
        let nib = UINib(nibName: NameCell.identifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: NameCell.identifier)
        collectionView.dataSource = self
    }

}




// MARK: - DataSource

extension PrepareLayoutViewController: UICollectionViewDataSource {
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
