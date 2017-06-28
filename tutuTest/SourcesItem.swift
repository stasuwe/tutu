//
//  SourcesItem.swift
//  tutuTest
//
//  Created by Станислав Сарычев on 26.06.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import Foundation

struct SourcesItem {
    let id: String
    let name: String
    let description: String
    let category: Category
    let language: Language
    let country: Country
    let url: String
    
    init?(json: [String: Any]) {
        
        guard
            let _id = json["id"] as? String,
            let _name = json["name"] as? String,
            let _description = json["description"] as? String,
            let _categoryString = json["category"] as? String,
            let _category = Category(rawValue: _categoryString),
            let _languageString = json["language"] as? String,
            let _language = Language(rawValue: _languageString),
            let _countryString = json["country"] as? String,
            let _country = Country(rawValue: _countryString),
            let _url = json["url"] as? String
            else { return nil }
        
        self.id = _id
        self.name = _name
        self.description = _description
        self.category = _category
        self.language = _language
        self.country = _country
        self.url = _url
    }
    
}
