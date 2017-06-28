//
//  SourcesInteractorIO.swift
//  tutuTest
//
//  Created by Станислав Сарычев on 26.06.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import Foundation

protocol SourcesInteractorInput: class {
    typealias FetchCompletion = (_ sources: [SourcesItem]) -> ()
    
    func fetchSources(withFilter filter: SourcesFilter, completion: @escaping FetchCompletion)
    
}

protocol SourcesInteractorOutput {}
