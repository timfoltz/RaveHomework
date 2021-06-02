//
//  ViewController.swift
//  delegation
//
//  Created by Luat on 6/2/21.
//

import UIKit

// MVC
class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var data = [
        "test 1",
        "test 2",
        "test 3",
        "test 4",
        "test 5",
    ]
    var myDataSource: UITableViewDataSource!
    var myDelegate = MyTableDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myDataSource = TableDataSource(models: data)
        tableView.dataSource = myDataSource
        myDelegate.controllerDelegate = self
        tableView.delegate = myDelegate
    }
}
