//
//  ViewController.swift
//  colorCollectionView
//
//  Created by Luat on 6/8/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let count = 100
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    func configureCollectionView() {
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "Cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        configureFlowLayout()
    }

    func configureFlowLayout() {
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        guard let customCell = cell as? CollectionViewCell else { fatalError() }

        customCell.backgroundColor = randomColor(row: indexPath.row)
        return customCell
    }

    func randomColor(row: Int) -> UIColor {
        let zeroRatio: Float = 1 - Float(row) / Float(count)
        let oneRatio: Float = Float(row) / Float(count)
        return UIColor(red: CGFloat(zeroRatio),
                       green: CGFloat(1),
                       blue: CGFloat(oneRatio),
                       alpha: 1)
//        return UIColor(red: CGFloat(Float.random(in: 0 ..< 1)), green: CGFloat(1), blue: CGFloat(Float.random(in:  0..<1)), alpha: 1)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 100, height: 100)
//    }

}

