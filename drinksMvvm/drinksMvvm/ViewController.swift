//
//  ViewController.swift
//  drinksMvvm
//
//  Created by Luat on 6/15/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var drinksViewModel = DrinksViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVM()
        configureTableView()
        let string = "2021-06-15 11:22:59"
        let datFormatter = DateFormatter()
        datFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        var date = datFormatter.date(from: string)
        if let date = date {
            print("old date", datFormatter.string(from: date))
            
        }
        let timeInterval = TimeInterval(7200)
        date?.addTimeInterval(timeInterval)
        if let date = date {
            print("new date")
            print(datFormatter.string(from: date ))
        }
    }
    
    func configureTableView() {
        let nib = UINib(nibName: DrinkCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: DrinkCell.identifier)
        tableView.dataSource = self
    }
    func setupVM() {
        drinksViewModel.updateUI = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return drinksViewModel.rowCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DrinkCell.identifier, for: indexPath) as? DrinkCell else {
            return UITableViewCell()
        }
        // Create viewmodel for each cell
//        cell.nameLabel.text = CellViewModel
        let cellVM = drinksViewModel.createCellViewModel(for: indexPath.row)
        
        cell.configure(viewModel: cellVM)
        return cell
        
    }
    
    
}
