//
//  SourcesViewIO.swift
//  tutuTest
//
//  Created by Станислав Сарычев on 26.06.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import Foundation

struct SourcesViewItem {
    let name: String
    let category: String
    let description: String
    
    var onSelectSource: () -> ()
}


protocol SourcesViewInput: class, ViewLifecycleObservable {
    
    func setTitle(_ title: String)
    func showLoading()
    func setData(_ data: [SourcesViewItem])
    
    var onFilterTap: (() -> ())? { get set }
}

protocol SourcesViewOutput {}
