//
//  CharacterModel.swift
//  Marvel_App
//
//  Created by admin on 1/28/22.
//

import Foundation

struct CharacterModel: Codable {
    
    let totalResult: Int?
    let articles: [ArticleModel]?
    
    enum CodingKeys: String, CodingKey {
        
        case totalResult = "totalResults"
        case articles = "articles"
    }
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        if let total = try? values.decode(Int.self, forKey: .totalResult) {
            totalResult = total
        } else {
            totalResult = nil
        }
        
        if let articlesValue = try? values.decode([ArticleModel].self, forKey: .articles) {
            articles = articlesValue
        }else {
            articles = nil
        }
    }

}

struct ArticleModel: Codable {
    
    let titleText: String
    let description: String
    let imgUrl: String
    
    enum CodingKeys: String, CodingKey {
        
        case titleText = "title"
        case description = "description"
        case imgUrl = "urlToImage"
    }
    
    init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        titleText = try values.decode(String.self, forKey: .titleText)
        description = try values.decode(String.self, forKey: .description)
        imgUrl = try values.decode(String.self, forKey: .imgUrl)
    }
    
}
