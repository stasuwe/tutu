//
//  FilterViewTests.swift
//  tutuTest
//
//  Created by Станислав Сарычев on 27.06.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import XCTest
@testable import tutuTest

class FilterViewTests: XCTestCase {
    
    fileprivate var filterViewController: FilterViewController!
    
    override func setUp() {
        super.setUp()
        
        filterViewController = FilterViewController(style: .grouped)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSetTitle() {
        let testTitle = "Test title"
        
        (filterViewController as FilterViewInput).setTitle(testTitle)
        
        XCTAssertEqual(testTitle, filterViewController.title, "Wrong title oi FilterViewController!")
    }
    
    func testSetData() {
        
        let section = FilterViewItem.Section(title: "Section title", type: .category, items: [FilterViewItem.Section.Item(title: "Item title", selected: false)])
        let data = FilterViewItem(sections: [section], onSelectItem: nil)
        
        (filterViewController as FilterViewInput).setData(data)
        
        XCTAssertNotNil(filterViewController.tableView, "FilterViewController view must be set!")
        XCTAssertEqual(filterViewController.tableView.numberOfSections, 1, "Wrong viewData was set!")
        XCTAssertEqual(filterViewController.tableView.numberOfRows(inSection: 0), 1, "Wrong viewData was set!")
    }
}
