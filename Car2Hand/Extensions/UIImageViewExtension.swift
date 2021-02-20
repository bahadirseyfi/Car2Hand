//
//  UIImageViewExtension.swift
//  Car2Hand
//
//  Created by bahadir on 14.02.2021.
//

import UIKit


extension UIImageView {

    func setupImage(by urlString: String?, imageSize: String){
    
    guard let string = urlString else { return }
    let modifiedString = string.replacingOccurrences(of: "{0}", with: imageSize, options: .literal, range: nil)
    guard let url = URL(string: modifiedString) else { return }
    let request = URLRequest(url: url)
    let session = URLSession.shared
    
    let cache = URLCache.shared
    if let response = cache.cachedResponse(for: request) {
        self.image = UIImage(data: response.data)
        return
    }
        self.startActivityIndicator()
        session.dataTask(with: request, completionHandler: { (data, response, error) in
            
            self.stopActivityIndicator()
            DispatchQueue.main.async {
                if let data = data {
                    self.image = UIImage(data: data)
                    if let response = response {
                        let cache = URLCache.shared
                        let urlResponse = CachedURLResponse(response: response, data: data)
                        cache.storeCachedResponse(urlResponse, for: request)
                    }
                }
            }
        }).resume()
    }
}
