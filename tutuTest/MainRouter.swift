//
//  MainRouter.swift
//  tutuTest
//
//  Created by Станислав Сарычев on 27.06.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import UIKit

protocol MainRouterInput {
    func open()
    func close()
}

final class MainRouter {
    
    enum PresentationStyle {
        case show(vc: UIViewController)
        case modal(vc: UIViewController, inNavigationController: Bool)
        case fullscreen(vc: UIViewController)
    }
    
    weak var rootViewController: UINavigationController?
    
    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
        start()
    }
    
    func open(presentationStyle style: PresentationStyle, animated: Bool) {
        
        switch style {
        case .show(let vc):
            rootViewController?.pushViewController(vc, animated: animated)
            
        case .modal(let vc, let inNavigationController):
            if inNavigationController {
                rootViewController?.present(UINavigationController(rootViewController: vc),
                                            animated: animated, completion: nil)
            } else {
                rootViewController?.present(vc, animated: animated, completion: nil)
            }
            
        case .fullscreen(vc: let vc):
            rootViewController?.setViewControllers([vc], animated: animated)
        }
    }
    
    func close(animated: Bool) {
        if rootViewController?.presentedViewController != nil {
            rootViewController?.presentedViewController?.dismiss(animated: animated, completion: nil)
        } else {
            rootViewController?.popViewController(animated: animated)
        }
    }
    
    fileprivate func start() {
        let sourcesModule = SourcesAssembly.createModule(root: self)
        open(presentationStyle: .fullscreen(vc: sourcesModule), animated: false)
    }
    
}
