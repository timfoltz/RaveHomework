//
//  ViewController.swift
//  Avatar
//
//  Created by Luat on 6/6/21.
//
/* MVC Design
 Model: Parsing, Storage (Database), Business logic (Data manipulation)
 View: Rendering visuals, Data formatting (Presentation layer), listen for user events
 Controller: Networking, Routing, Handle User events
 */

/**
 /// Features
 1) MVC architecture design pattern
  - ???
 2) In-memory Cache
 2) Pagination
 3) API Manager
  - Separates networking code from MVC
  - Add Query Strings to url request
 4) Self sizing collectionViewCells for height dimension
 5) Responsible threading:
  - long running tasks on global() queue (asynchronously loading images)
  - Fetch multiple pages in numerical order
    - Coordinate API calls using DispatchGroups
    - Only reload collectionView once after all data are fetched
 6) Use completionHandler (closures) to communicate between APIManager, ImageCache, ViewController
 7) Activity Indicator view to give visual cues
 */

import UIKit
let avartarUrl = URL(string: "https://last-airbender-api.herokuapp.com/api/v1/characters")!

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    var apiManager: AvatarAPIManager?
    var model: [Character]? {
        didSet {
            preLoadImageCache()
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiManager = ConcreteAPIManager()
        configureCollectionView()
        DispatchQueue.global().async {
            self.getCharacters(from: 1, to: 20)
        }
        
        let ints = [1,2,3,4]

        let str = ints.map { String($0)}
        print(String(-100))
        let container = UIView()
        
        let rect = UIView()
        
        container.addSubview(rect)
        container.frame = CGRect(x: 0, y: 0, width: 500, height: 500)
        rect.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        rect.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
        print(rect.frame)
        print(rect.bounds)
    
    }
    
    func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        let nib = UINib(nibName: "AvatarCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "AvatarCell")
    }
    
    func getCharacters(from: Int, to: Int) {
        addSpinnerView()
        self.model = []
        var tempModels: [Character] = []
        let group = DispatchGroup()
        for num in from...to {
            group.enter()
            getCharacters(at: num) { (downloadedModels) in
                tempModels += downloadedModels
                group.leave()
            }
//            group.wait()
        }
        group.notify(queue: .main, work: DispatchWorkItem(block: {
            self.removeSpinnerView()
            self.model = tempModels
        }))
    }
    
    func getCharacters(at page: Int, completion: @escaping ([Character]) -> Void) {
        apiManager?.getModelsAt(page: page) { (data) in
            guard let data = data else { return }
            let chars = try? JSONDecoder().decode([Character].self, from: data)
            if let chars = chars {
                completion(chars)
            }
        }
    }
    
    func getNextCharactersPagination() {
        addSpinnerView()
        let nextPage = (model?.count ?? 0) / 20 + 1
        getCharacters(at: nextPage) { newChars in
            self.model? += newChars
            print("New model count: \(self.model?.count ?? 0)")
            self.removeSpinnerView()
        }
    }
    
    func preLoadImageCache() {
        guard let model = model else { return }
        print("model count \(model.count)")
        for char in model {
            if let photoUrl = char.photoUrl {
                ImageCache.shared.loadImage(from: photoUrl, completionHandler: { _ in
                    print("preloading image to cache for: \(char.name ?? "")")
                })
            }
        }
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AvatarCell", for: indexPath) as? AvatarCell else { fatalError() }
        
        if let charModel = model?[indexPath.row] {
            cell.configure(model: charModel)
            ImageCache.shared.loadImage(from: charModel.photoUrl ?? "") { image in
                if let visibleCell = collectionView.cellForItem(at: indexPath) as? AvatarCell {
                    visibleCell.imageView.image = image
                }
            }
        }
        
        return cell
    }
    
}
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selecting row: \(indexPath.row) section: \(indexPath.section) \n \(model?[indexPath.row].affiliation ?? "")")
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let count = self.model?.count ?? 0
        if indexPath.row == count - 1 {
            print("Total cells \(count)")
            getNextCharactersPagination()
        }
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 220)
    }
}

extension ViewController {
    func addSpinnerView() {
        DispatchQueue.main.async {
            self.spinner.startAnimating()
            self.view.addSubview(self.spinner)
            self.spinner.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
            self.spinner.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        }
        
    }
    func removeSpinnerView() {
        DispatchQueue.main.async {
            self.spinner.stopAnimating()
            self.spinner.removeFromSuperview()
        }
    }
}
