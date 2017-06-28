//
//  FilterViewController.swift
//  tutuTest
//
//  Created by Станислав Сарычев on 26.06.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import UIKit

class FilterViewController: BaseTableViewController, FilterViewInput {

    //MARK: - FilterViewInput
    var onDoneTap: (() -> ())?
    
    @nonobjc func setTitle(_ title: String) {
        self.title = title
    }
    
    func setData(_ data: FilterViewItem) {
        filterView.setData(data)
    }
    
    
    //MARK: - main
    var output: FilterViewOutput?
    fileprivate let filterView = FilterView()
    
    override func loadView() {
        super.loadView()
        view = filterView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonHandler))
        navigationItem.rightBarButtonItem = doneButton
        
    }

    @objc func doneButtonHandler() {
        onDoneTap?()
    }
    

    
}
