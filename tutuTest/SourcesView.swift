//
//  SourcesView.swift
//  tutuTest
//
//  Created by Станислав Сарычев on 26.06.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import UIKit

class SourcesView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    func setData(_ data: [SourcesViewItem]) {
        viewData = data
        tableFooterView = UIView()
        reloadData()
        if data.count == 0 {
            showEmptyView()
        }
    }
    
    
    fileprivate let cellReuseIdentifier = "SourcesCellIdentifier"
    fileprivate var viewData = [SourcesViewItem]()
    
    init() {
        super.init(frame: .zero, style: .plain)
        dataSource = self
        delegate = self
        register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - UITableViewDatasource 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        cell.textLabel?.text = viewData[indexPath.row].name
        return cell
    }
    
    //MARK: - UITableviewdelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewData[indexPath.row].onSelectSource()
    }
    
}
