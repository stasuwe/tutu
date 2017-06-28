//
//  FilterAssembly.swift
//  tutuTest
//
//  Created by Станислав Сарычев on 26.06.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import UIKit

class FilterAssembly {
    
    static func createModule() -> (UIViewController, FilterModuleInput) {
        
        let presenter = FilterPresenter()
        let view = FilterViewController(style: .grouped)
        
        view.output = presenter
        presenter.view = view
        
        return (view, presenter)
    }
    
}
