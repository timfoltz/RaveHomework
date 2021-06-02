//
//  TableDelegate.swift
//  delegation
//
//  Created by Luat on 6/2/21.
//

import UIKit

class MyTableDelegate: NSObject, UITableViewDelegate {
    
    weak var controllerDelegate: UIViewController?
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("attemping to push details VC")
        guard let vc = controllerDelegate?.storyboard?.instantiateViewController(identifier: "DetailsViewController") as? DetailsViewController else { return }
        controllerDelegate?.navigationController?.pushViewController(vc, animated: true)
        print("selecting \(indexPath.row)")
    }
}
