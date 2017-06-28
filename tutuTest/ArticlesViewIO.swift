//
//  ArticlesViewIO.swift
//  tutuTest
//
//  Created by Станислав Сарычев on 27.06.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import Foundation

struct ArticlesViewItem {
    let title: String
    let author: String
    let imageURL: URL
    
    var onSelectArticle: () -> ()
}

protocol ArticlesViewInput: class, ViewLifecycleObservable {
    
    func setTitle(_ title: String)
    func showLoading()
    func setData(_ data: [ArticlesViewItem])
    
}

protocol ArticlesViewOutput {}
