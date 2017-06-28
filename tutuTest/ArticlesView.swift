//
//  ArticlesView.swift
//  tutuTest
//
//  Created by Станислав Сарычев on 27.06.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import UIKit

class ArticlesView: UITableView, UITableViewDataSource, UITableViewDelegate {

    func setData(_ data: [ArticlesViewItem]) {
        viewData = data
        tableFooterView = UIView()
        reloadData()
        if data.count == 0 {
            showEmptyView()
        }
    }
    
    
    fileprivate let cellReuseIdentifier = "ArticleCellIdentifier"
    fileprivate var viewData = [ArticlesViewItem]()
    
    init(){
        super.init(frame: .zero, style: .plain)
        dataSource = self
        delegate = self
        rowHeight = 100
        register(ArticlesTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        tableFooterView = UIView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - UITableViewDatasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! ArticlesTableViewCell
        
        cell.articleItem = viewData[indexPath.row]

        return cell
    }
    
    //MARK: - UITableVIewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewData[indexPath.row].onSelectArticle()
    }
}
