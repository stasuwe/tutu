//
//  SourcesFilter.swift
//  tutuTest
//
//  Created by Станислав Сарычев on 26.06.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import Foundation

struct SourcesFilter {
    
    var category: Category
    var language: Language
    var country: Country
    
    static var `default`: SourcesFilter {
        return SourcesFilter(category: .all, language: .en, country: .gb)
    }
}
