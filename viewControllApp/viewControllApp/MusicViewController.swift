//
//  MusicViewController.swift
//  viewControllApp
//
//  Created by Luat on 6/1/21.
//

import UIKit

class MusicViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var musicModel: MusicModel? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        APIManager.shared.getData { decodedModel in
            self.musicModel = decodedModel
        }
    }
    
    func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        let nib = UINib(nibName: MusicCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: MusicCell.identifier)
    }
    
    deinit {
        print("music VC deinit")
    }
    
    
}


extension MusicViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicModel?.feed.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MusicCell.identifier, for: indexPath) as? MusicCell else {
            let cell = UITableViewCell()
            cell.textLabel?.text = "testing \(indexPath.row)"
            return cell
            
        }
        cell.topLabel.text = "this is a music cell"
        cell.bottomLabel.text = musicModel?.feed.results[indexPath.row].artistName
        
        return cell
    }
}

extension MusicViewController: UITableViewDelegate {
    // Delegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(identifier: "DetailsViewController") else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}
