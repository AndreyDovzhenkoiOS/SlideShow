//
//  NetworkManager.swift
//  SlideShow
//
//  Created by Andrey on 17.07.2018.
//  Copyright © 2018 Andrey Dovzhenko. All rights reserved.
//

import UIKit

final class NetworkManager: NSObject {
    
    //MARK: - Property
    
    private let cache = NSCache <NSString, UIImage>()
    
    //MARK: - Initialization
    
    static let shared = NetworkManager()
    private override init() {}
    
    //MARK: - Functions
    
    public func getImage(_ url: URL, completion: @escaping(_ : UIImage)-> ()) {
        if let image = cache.object(forKey: (url.absoluteString) as NSString) {
            completion(image)
        } else {
            downloadImage(url, completion: completion)
        }
    }
    
    private func downloadImage(_ url: URL, completion: @escaping(_ : UIImage)-> ()) {
        let dataTask = URLSession.shared.dataTask(with: url) { data, _ , _ in
            let downloadImage = UIImage(data: data!)!
            self.cache.setObject(downloadImage, forKey:(url.absoluteString) as NSString )
            DispatchQueue.main.async {completion(downloadImage)}
        }
        dataTask.resume()
    }
}
