//
//  Constants.swift
//  Marvel_App
//
//  Created by admin on 1/31/22.
//

import Foundation
import UIKit

let screenSize = UIScreen.main.bounds.size

struct APIUrl {
    static let url = "https://newsapi.org/v2/everything?q=Apple&apiKey=2aea66d7a3bd4c308a8112ae291f1e6e"
}

struct ImagePlaceholder {
    static let image = "images_1"
    
}

struct AppConstant {
    
    static let characters = "Characters"
}

struct Identifier {
    static let characterCell = "CharacterCell"
    static let detailViewController = "CharacterDetailViewController"
}
