//
//  FilterModuleInput.swift
//  tutuTest
//
//  Created by Станислав Сарычев on 26.06.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import Foundation

protocol FilterModuleInput {
    typealias FilterModuleInputCompletion = (_ newFilter: SourcesFilter) -> ()
    
    func setupWithFilter(_ filter: SourcesFilter, completion: FilterModuleInputCompletion?)

}
