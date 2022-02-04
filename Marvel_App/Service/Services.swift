//
//  Services.swift
//  Marvel_App
//
//  Created by admin on 1/28/22.
//

import Foundation

public struct Services {
    
    static func getCharacterList(url: String, page: String, callback: @escaping (_ success: Bool, _ data: CharacterModel? )->()) {
        let completeUrl = url + "&page=" + page
        guard let url = URL(string: completeUrl) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url,  completionHandler: { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    debugPrint(error.localizedDescription)
                    
                } else if let httpResponse = response as? HTTPURLResponse {
                    
                    if httpResponse.statusCode == 200 {
                        guard let data = data else { return }
                        let decoder = JSONDecoder()
                        if let response = try? decoder.decode(CharacterModel.self, from: data) {
                            callback(true, response)
                            
                        } else {
                            callback(false, nil)
                        }
                        
                    } else {
                        callback(false, nil)
                    }
                }
            }
        })
        task.resume()
    }
}

