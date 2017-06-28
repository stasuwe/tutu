//
//  ArticleItem.swift
//  tutuTest
//
//  Created by Станислав Сарычев on 27.06.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import Foundation

struct ArticleItem {
    let title: String
    let author: String
    let imageURL: URL
    let articleURL: URL
    
    init?(json: [String: Any]) {
        guard
            let _title = json["title"] as? String,
            let _imageURLString = json["urlToImage"] as? String,
            let _imageURL = URL(string: _imageURLString),
            let _articleURLString = json["url"] as? String,
            let _articleURL = URL(string: _articleURLString)
            else { return nil }
        
        self.title = _title
        self.author = json["author"] as? String ?? "No information"
        self.imageURL = _imageURL
        self.articleURL = _articleURL
    }
    
}
