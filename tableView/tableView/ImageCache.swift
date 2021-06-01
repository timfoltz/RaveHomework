//
//  ImageCache.swift
//  tableView
//
//  Created by Luat on 5/31/21.
//

import UIKit

class ImageCache {
    
    static let shared = ImageCache()
    private var cache = NSCache<NSString, UIImage>()
    private init() {}
    
    func loadImage(from urlString: String, completionHandler: ((UIImage) -> ())?) {
        guard let url = URL(string: urlString) else { return }
        let imageUrl = urlString as NSString
        if let cachedImage = cache.object(forKey: imageUrl) {
            DispatchQueue.main.async {
                completionHandler?(cachedImage)
            }
        } else {
            guard let placeholder = UIImage(systemName: "star") else { return }
            DispatchQueue.main.async {
                completionHandler?(placeholder)
            }
            let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
//                usleep(100_000)
                if let myData = data, let image = UIImage(data: myData) {
                    DispatchQueue.main.async {
                        completionHandler?(image)
                        self.cache.setObject(image, forKey: urlString as NSString)
                    }
                }
            }
            task.resume()
        }
    }
    
    func downloadAllImages(for model: DrinkModel?) {
        for drink in model!.drinks {
            let urlString = drink.imageURL
            loadImage(from: urlString, completionHandler: nil)
        }
    }
    
}
