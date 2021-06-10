//
//  ViewController.swift
//  observers
//
//  Created by Luat on 6/10/21.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    /** Desgin Patterns
     
        1) Creational:
            - Builder
            - Factory
            - Singleton
        2) Structual:
            - Decorator (extensions)
            - MVC (architecture design pattern)
            - MVVM: (??) Model, View, ViewModel
            - VIPER: (??) View, Interactor, Presenter, Entity, Router
        3) Behavioral:
            - Observer:
                i) Property Observer
                ii) Delegate (tableView.didSelectRowAt()) :    one - one
                iii) Publisher-Subscriber: NotificationCenter : one - many
                iv) KVO: Key-Value-Observing
            - Memento: (??) saveState() restoreState()
     */

    /// Property Observer
    var myChangingValue: Int = 0 {
        didSet {
            print("My value changed: \(myChangingValue)")
        }
    }

    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myChangingValue = 6
        myChangingValue = 10
        
        /// Notification Center: Publisher-subscriber observation
        startNCObserving()
        postNotification()
        
        /// KVO
        webViewAndKVO()
    }
    
    func startNCObserving() {
        NotificationCenter.default.addObserver(self, selector: #selector(triggeredByObservation), name: Notification.Name("userSignIn"), object: nil)
    }
    
    @objc func triggeredByObservation() {
        print("=== Notification Center: was OBSERVED ===")
    }
        
    func postNotification() {
        let notificationName = Notification.Name("userSignIn")
        let notification = Notification(name: notificationName)

        NotificationCenter.default.post(notification)
        NotificationCenter.default.post(name: notificationName, object: nil)
    }
    
    
    func webViewAndKVO() {
        createWebView()
                        
        /// Setup KVO by addingObserver method
        /// - have to override observeValue()
        /// - call removeObserver() afterwards
//        setupKVOWithAddObserver()

        /// Setup KVO by adding closure to be called by webView (block based observation)
        /// - have to set observation closure to nil
        setupKVOWithBlock()
    }

    func createWebView() {
        webView = WKWebView(frame: view.bounds)
        view.addSubview(webView)
        let url = URL(string: "https://google.com")!
        webView.load(URLRequest(url: url))
    }
    
    
    /// KVO: AddObserver method Step 1
    func setupKVOWithAddObserver() {
        let pathsToObserve = ["estimatedProgress", "URL"]
        for keyPath in pathsToObserve {
            webView.addObserver(self, forKeyPath: keyPath, options: .new, context: nil)
        }
        
    }
    
    /// KVO: AddObserver method Step 2
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        guard let keyPath = keyPath else {
            return
        }
        switch keyPath {
        case "URL":
            if let newValue = change?[.newKey] {
                print("KVO addObserver(): Loading URL: \(newValue)")
            }
        case "estimatedProgress":
            if let newValue = change?[.newKey] {
                print("EstimatedProgress: \(newValue)")
            }
        default:
            print("nothing to see")
        }
    }
    
    deinit {
        /// KVO: AddObserver method Step 3
//        let pathsToObserve = ["estimatedProgress", "URL"]
//        for keyPath in pathsToObserve {
//            webView.removeObserver(self, forKeyPath: keyPath)
//        }
        
        /// KVO: Observation block method Step 3
        urlOBservation = nil
        estimateObservation = nil
    }
    
    /// KVO: Observation block method Step 1
    var urlOBservation: NSKeyValueObservation?
    var estimateObservation: NSKeyValueObservation?
    
    /// KVO: Observation block method Step 2
    func setupKVOWithBlock() {
        urlOBservation = webView.observe(\.url, options: .new) { webView, observedChange in
            print("KVO observation block: value", observedChange.newValue! ?? "no value")
        }
    
        estimateObservation = webView.observe(\.estimatedProgress, options: .new) { webView, observedChange in
            print(observedChange.newValue ?? "no value")
        }
    }
}

