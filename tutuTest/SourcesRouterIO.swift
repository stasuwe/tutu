//
//  SourcesRouterIO.swift
//  tutuTest
//
//  Created by Станислав Сарычев on 27.06.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import Foundation

protocol SourcesRouterInput {
    
    typealias OpenFilterCompletion = (_ newFilter: SourcesFilter) -> ()
    
    func openArticlesForSource(_ source: String, withTitle title: String)
    func openFilterWithConfiguration(_ configuration: SourcesFilter, completion: @escaping OpenFilterCompletion)
}

protocol SourcesRouterOutput {}
