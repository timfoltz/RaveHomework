//
//  ViewController.swift
//  userCoreData
//
//  Created by Luat on 6/20/21.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBAction func signInButton(_ sender: Any) {
        let name = nameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let results = findUser(name: name, email: email)
        if let results = results, results.isEmpty {
            print("user not found")
        } else {
            print("signing in \(results?.first?.email ?? "")")
        }
    }
    @IBAction func createButton(_ sender: Any) {
        let name = nameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        print("creating \(email)")
        createUser(name: name, email: email)
    }
    
    @IBAction func showUsersButton(_ sender: Any) {
        findUsers()
    }
    
    @IBAction func deleteAllUsersButton(_ sender: Any) {
        deleteUsersAll()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func createUser(name: String, email: String) {
        /// Accessing AppDelegate's property
        let persistentContainer = AppDelegate.persistentContainer
        
        /// Access viewContext
        let viewContext = persistentContainer.viewContext
        
        /// Writing objects to scratch paper (aka viewContext)
        let user = UserModel(context: viewContext)
        user.name = name
        user.email = email
        user.products?.forEach({ any in
            if let product = any as? ProductModel {
                print(product.price)
            }
        })
        /// Try to save() the current changes in viewContext
        try? viewContext.save()
        
    }
    
    func findUsers() {
        /// Create a NSFetchRequest with object type
//        let userRequest = NSFetchRequest<UserModel>(entityName: "UserModel")
        let userRequest: NSFetchRequest<UserModel> = UserModel.fetchRequest()
        /// ViewContext calls fetch method with fetch request

        /// Accessing AppDelegate's property
        let abstractDelegate = UIApplication.shared.delegate
        let appDelegate = abstractDelegate as? AppDelegate
        let persistentContainer = appDelegate?.persistentContainer
        
        /// Writing to scratch paper (aka viewContext)
        guard let viewContext = persistentContainer?.viewContext else {
            return
        }
        
        let users = try? viewContext.fetch(userRequest)
        users?.forEach {
            print("name: \($0.name) email: \($0.email)")
        }
    }

    
    func deleteUsersForEach() {
        /// 1) Access View Context
        let context = AppDelegate.viewContext
        
        /// 2) Get all users: NSFetchRequest
        let request: NSFetchRequest<UserModel> = UserModel.fetchRequest()
        let users = try? context.fetch(request)
        
        /// 3) Delete Each users in loop
        users?.forEach {
            context.delete($0)
        }
        try? context.save()
    }
    
    func deleteUsersAll() {
        let request: NSFetchRequest<NSFetchRequestResult> = UserModel.fetchRequest()
        let batchRequest = NSBatchDeleteRequest(fetchRequest: request)
        _ = try? AppDelegate.viewContext.execute(batchRequest)
    }
    
    func findUser(name: String, email: String) -> [UserModel]? {
        let context = AppDelegate.persistentContainer.viewContext
        
        let request: NSFetchRequest<UserModel> = UserModel.fetchRequest()
        
        /// filter the request
        request.predicate = NSPredicate(format: "email = %@ AND name = %@", email, name)
        
        let results = try? context.fetch(request)
        results?.forEach { print($0.email ?? "") }
        return results
    }
}

