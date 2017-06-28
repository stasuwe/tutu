//
//  SourcesViewController.swift
//  tutuTest
//
//  Created by Станислав Сарычев on 26.06.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import UIKit

class SourcesViewController: BaseTableViewController, SourcesViewInput {

    //MARK: - SourcesViewInput
    @nonobjc func setTitle(_ title: String) {
        self.title = title
    }
    
    func setData(_ data: [SourcesViewItem]) {
        DispatchQueue.main.async {
            self.sourcesView.setData(data)
        }
    }
    
    func showLoading() {
        sourcesView.showLoadingView()
    }
    
    var onFilterTap: (() -> ())?
    
    
    //MARK: - main
    var output: SourcesViewOutput?
    
    fileprivate let sourcesView = SourcesView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = sourcesView
        
        let filterButton = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(filterTapHandler))
        navigationItem.rightBarButtonItem = filterButton
    }
    
    @objc func filterTapHandler() {
        onFilterTap?()
    }

}
