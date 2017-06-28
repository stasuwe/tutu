//
//  FilterPresenterTests.swift
//  tutuTest
//
//  Created by Станислав Сарычев on 27.06.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import XCTest
@testable import tutuTest

class FilterPresenterTests: XCTestCase {
    
    class FilterViewMock: UIView, FilterViewInput {
        
        var title: String?
        var data: FilterViewItem?
        var onDoneHandler: (() -> ())?
        
        //MARK: - ViewLifecycleObservable
        var onViewDidLoad: (() -> ())?
        var onViewWillAppear: (() -> ())?
        
        //MARK: - FilterViewInput protocol
        @nonobjc func setTitle(_ title: String) {
            self.title = title
        }
        
        func setData(_ data: FilterViewItem) {
            self.data = data
        }
        
        var onDoneTap: (() -> ())? {
            get { return onDoneHandler }
            set { onDoneHandler = newValue }
        }
    }
    
    fileprivate var filterPresenter: FilterPresenter!
    fileprivate var filterView: FilterViewMock!
    
    override func setUp() {
        super.setUp()
        
        filterPresenter = FilterPresenter()
        filterView = FilterViewMock(frame: .zero)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSetupWithFilter() {
        
        let filter = SourcesFilter(category: .business,
                                   language: .en,
                                   country: .gb)
        
        
        filterPresenter.view = filterView
        filterPresenter.setupWithFilter(filter, completion: nil)
        filterView.onViewDidLoad?()
        
        
        XCTAssertNotNil(filterView.title, "Filter view title must be set!")
        XCTAssertEqual(filterView.title, "Filter", "Filter title must be - 'Filter'")
        
        XCTAssertNotNil(filterView.data, "Filter view data must be set!")
        XCTAssertEqual(filterView.data?.sections.count, 3, "Wrong filter data set!")
        
        XCTAssertNotNil(filterView.onDoneHandler, "Filter view done button handler must be set!")
    }
    
    func testFilterModuleInputCompletion() {
        var resultFilter: SourcesFilter? = nil
        
        let filter = SourcesFilter(category: .business,
                                   language: .en,
                                   country: .gb)
        let completion = { newFilter  in
            resultFilter = newFilter
        }
        
        
        filterPresenter.view = filterView
        filterPresenter.setupWithFilter(filter, completion: completion)
        filterView.onViewDidLoad?()
        filterView.onDoneTap?()
        
        XCTAssertNotNil(resultFilter, "Filter not set when Done button press!")
    }
    
}
