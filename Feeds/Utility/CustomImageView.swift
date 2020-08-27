//
//  CustomImageView.swift
//  Feeds
//
//  Created by Nishita Shukla on 27/08/20.
//  Copyright © 2020 Nishita Shukla. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, AnyObject>()

class CustomImageView: UIImageView {
    
    var imageUrlString: String?
    
    func loadImageUsingUrlString(urlString: String) {
        
        imageUrlString = urlString
        
        guard let url = URL(string: urlString) else { return }
        
        image = nil
        
        if let imageFromCache = imageCache.object(forKey: urlString as NSString) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        URLSession.shared.dataTask(with:url, completionHandler: { (data, response, error) in
            
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            
            DispatchQueue.main.async {
                let imageToCache = UIImage(data: data!)
                
                if imageToCache != nil
                {
                if self.imageUrlString == urlString {
                    self.image = imageToCache
                }
                
                imageCache.setObject(imageToCache!, forKey: urlString as NSString)
                }
                
            }
            
        }).resume()
    }
    
}
