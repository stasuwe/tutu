//
//  SourcesAssembly.swift
//  tutuTest
//
//  Created by Станислав Сарычев on 26.06.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import UIKit

class SourcesAssembly {
    
    static func createModule(root: MainRouter) -> UIViewController {
        
        let interactor = SourcesInteractor()
        let router = SourcesRouter(root: root, moduleFactory: ModuleFactory(mainRouter: root))
        let presenter = SourcesPresenter(interactor: interactor, router: router)
        let view = SourcesViewController(style: .plain)
        
        view.output = presenter
        presenter.view = view
        
        return view
    }
    
}
