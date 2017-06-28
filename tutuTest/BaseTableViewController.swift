//
//  BaseTableViewController.swift
//  tutuTest
//
//  Created by Станислав Сарычев on 26.06.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController, ViewLifecycleObservable {
    
    //MARK: - ViewLifecycleObservable protocol
    var onViewDidLoad: (() -> ())?
    var onViewWillAppear: (() -> ())?
    
    
    //MARK: - base implementation
    override init(style: UITableViewStyle) {
        super.init(style: style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onViewDidLoad?()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        onViewWillAppear?()
    }

}
