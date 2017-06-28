//
//  ArticlesViewController.swift
//  tutuTest
//
//  Created by Станислав Сарычев on 27.06.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import UIKit

class ArticlesViewController: BaseTableViewController, ArticlesViewInput {

    //MARK: - ArticlesViewInput
    @nonobjc func setTitle(_ title: String) {
        self.title = title
    }
    
    func setData(_ data: [ArticlesViewItem]) {
        DispatchQueue.main.async {
            self.articlesView.setData(data)
        }
    }
    
    func showLoading() {
        articlesView.showLoadingView()
    }

    
    //MARK: - main
    var output: ArticlesViewOutput?
    fileprivate let articlesView = ArticlesView()
    
    override func loadView() {
        super.loadView()
        view = articlesView
    }

}
