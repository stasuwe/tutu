//
//  UITableViewExtensions.swift
//  tutuTest
//
//  Created by Станислав Сарычев on 27.06.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import UIKit

extension UITableView {
    
    fileprivate var loadingView: UIView {
        let view = UIView(frame: .zero)
        view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        return view
    }
    
    fileprivate var emptyView: UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: bounds.width, height: 50))
        let label = UILabel(frame: .zero)
        
        label.text = "Oops.. there is no records :("
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        return view
    }

    func showLoadingView() {
        tableFooterView = loadingView
    }
    
    func showEmptyView() {
        tableFooterView = emptyView
    }
    
}
