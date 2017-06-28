//
//  ArticlesAssembly.swift
//  tutuTest
//
//  Created by Станислав Сарычев on 27.06.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import UIKit

class ArticlesAssembly {
    
    static func createModule() -> (view: UIViewController, input: ArticlesModuleInput) {
        
        let interactor = ArticlesInteractor()
        let presenter = ArticlesPresenter(interactor: interactor)
        let view = ArticlesViewController(style: .plain)
        
        view.output = presenter
        presenter.view = view
        
        return (view, presenter)
    }
    
}
