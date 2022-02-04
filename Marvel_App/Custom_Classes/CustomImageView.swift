//
//  CustomImageView.swift
//  Marvel_App
//
//  Created by admin on 2/1/22.
//

import Foundation
import UIKit

class CustomImageView: UIImageView {
    
    private static let imageCache = NSCache<AnyObject, AnyObject>()

    class func loadImageUsingCacheWithURLString(_ URLString: String, placeHolder: UIImage?, completionHandler: @escaping(_ image: UIImage?) -> ()) {

        if let cachedImage = imageCache.object(forKey: NSString(string: URLString)) {
            if let imgData = cachedImage as? Data, let img = UIImage(data: imgData) {
                completionHandler(img)
                return
            }
        }

        if let url = URL(string: URLString) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in

                //print("RESPONSE FROM API: \(response)")
                if error != nil {
                    debugPrint("ERROR LOADING IMAGES FROM URL: \(String(describing: error))")
                    DispatchQueue.main.async {
                        completionHandler(placeHolder)
                    }
                    return
                }
                DispatchQueue.main.async {
                    if let data = data {
                        if let downloadedImage = UIImage(data: data) {
                            imageCache.setObject(downloadedImage, forKey: NSString(string: URLString))
                            completionHandler(downloadedImage)
                        }
                    }
                }
            }).resume()
        }
    }
}
