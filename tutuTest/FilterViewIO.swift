//
//  FilterViewIO.swift
//  tutuTest
//
//  Created by Станислав Сарычев on 26.06.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import Foundation

struct FilterViewItem {

    struct Section {
        
        enum SectionType {
            case category, language, country
        }
        
        struct Item {
            let title: String
            let selected: Bool
        }
        
        let title: String
        let type: SectionType
        let items: [Item]
    }
    
    let sections: [Section]
    var onSelectItem: ((_ type: Section.SectionType, _ value: String) -> ())?
}

protocol FilterViewInput: class, ViewLifecycleObservable {
    
    func setTitle(_ title: String)
    func setData(_ data: FilterViewItem)
    
    var onDoneTap: (() -> ())? { get set }
}

protocol FilterViewOutput { }
