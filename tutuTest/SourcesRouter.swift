//
//  SourcesRouter.swift
//  tutuTest
//
//  Created by Станислав Сарычев on 27.06.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import Foundation

final class SourcesRouter: SourcesRouterInput {
    
    fileprivate let root: MainRouter
    fileprivate let moduleFactory: SourcesModuleFactory
    
    init(root: MainRouter, moduleFactory: SourcesModuleFactory){
        self.root = root
        self.moduleFactory = moduleFactory
    }
    
    func openArticlesForSource(_ source: String, withTitle title: String) {
        let articlesModule = moduleFactory.createArticlesModule()
        articlesModule.input.setupWith(source: source, title: title)
        root.open(presentationStyle: .show(vc: articlesModule.view), animated: true)
    }
    
    func openFilterWithConfiguration(_ configuration: SourcesFilter, completion: @escaping OpenFilterCompletion) {
        let filterModule = moduleFactory.createFilterModule()
        filterModule.input.setupWithFilter(configuration) { [weak self] newFilter in
            completion(newFilter)
            self?.root.close(animated: true)
        }
        root.open(presentationStyle: .modal(vc: filterModule.view, inNavigationController: true), animated: true)
    }
}
