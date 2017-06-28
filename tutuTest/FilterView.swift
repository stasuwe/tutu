//
//  FilterView.swift
//  tutuTest
//
//  Created by Станислав Сарычев on 26.06.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import UIKit

class FilterView: UITableView, UITableViewDataSource, UITableViewDelegate {

    func setData(_ data: FilterViewItem) {
        viewData = data
        reloadData()
    }
    
    
    fileprivate let cellReuseIdentifier = "FilterCellIdentifier"
    fileprivate var viewData: FilterViewItem?
    
    init() {
        super.init(frame: .zero, style: .grouped)
        dataSource = self
        delegate = self
        register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - UITableViewDatasource
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewData?.sections.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewData?.sections[section].items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath)
        let item = viewData?.sections[indexPath.section].items[indexPath.row]
        cell.textLabel?.text = item?.title
        cell.accessoryType = item?.selected != nil && item!.selected ? .checkmark : .none
        cell.selectionStyle = .none
        
        return cell
    }
    
    //MARK: UITabelViewDelegate 
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewData?.sections[section].title
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let section = viewData?.sections[indexPath.section],
            let item = viewData?.sections[indexPath.section].items[indexPath.row] else { return }
        viewData?.onSelectItem?(section.type, item.title)
    }
    
}
