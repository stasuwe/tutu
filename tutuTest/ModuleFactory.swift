//
//  ModuleFactory.swift
//  tutuTest
//
//  Created by Станислав Сарычев on 27.06.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import UIKit

protocol SourcesModuleFactory {
    func createArticlesModule() -> (view: UIViewController, input: ArticlesModuleInput)
    func createFilterModule() -> (view: UIViewController, input: FilterModuleInput)
}

final class ModuleFactory: SourcesModuleFactory {
    
    fileprivate let router: MainRouter
    
    init(mainRouter: MainRouter) {
        self.router = mainRouter
    }
    
    //MARK: - SourcesModuleFactory
    func createArticlesModule() -> (view: UIViewController, input: ArticlesModuleInput) {
        let module = ArticlesAssembly.createModule()
        return module
    }
    
    func createFilterModule() -> (view: UIViewController, input: FilterModuleInput) {
        let module = FilterAssembly.createModule()
        return module
    }
    
}
