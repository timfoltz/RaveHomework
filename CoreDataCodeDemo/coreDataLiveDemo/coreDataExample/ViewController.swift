//
//  ViewController.swift
//  coreDataExample
//
//  Created by Luat on 6/21/21.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createLukeUser()
        fetchAllUser()
        fetchUser(with: "luke5@gmail.com", and: "luke")
        
    }
    
    func createLukeUser() {
        /// Accessing the persistent container
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let container = appDelegate?.persistentContainer
        guard let viewContext = container?.viewContext else { return }
        
        /// Write object to viewContext
        let user = User(context: viewContext)
        user.email = "luke@gmail.com"
        user.name = "luke"
        
        let song = Song(context: viewContext)
        song.albumName = "fire"
        song.artistName = "taylor"
        song.owner = user
        
        /// Call viewContext .save()
        try? viewContext.save()
    }

    func fetchAllUser() {
        /// Accessing the persistent container
        let request: NSFetchRequest<User> = User.fetchRequest()
        
        let result = try? AppDelegate.viewContext.fetch(request)
        print(result)
        print("count \(result?.count)")
    }

    func fetchUser(with email: String, and name: String) {
        /// Accessing the persistent container
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let container = appDelegate?.persistentContainer
        guard let viewContext = container?.viewContext else { return }
        
        let request: NSFetchRequest<User> = User.fetchRequest()
        
        request.predicate = NSPredicate(format: "email = %@ OR name = %@", email, name)
        
        let result = try? viewContext.fetch(request)
//        print(result?.first?.songs)
        print("count \(result?.count)")
    }
    
    
    
}

