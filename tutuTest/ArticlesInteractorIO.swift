//
//  ArticlesInteractorIO.swift
//  tutuTest
//
//  Created by Станислав Сарычев on 27.06.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import Foundation

protocol ArticlesInteractorInput {
    typealias FetchCompletion = (_ articles: [ArticleItem]) -> ()
    
    func fetchArticles(withSource source: String, completion: @escaping FetchCompletion)
}

protocol ArticlesInteractorOutput { }
