//
//  FilterPresenter.swift
//  tutuTest
//
//  Created by Станислав Сарычев on 26.06.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import Foundation

final class FilterPresenter: FilterModuleInput, FilterViewOutput {
    
    //MARK: - FilterModuleInput
    func setupWithFilter(_ filter: SourcesFilter, completion: FilterModuleInputCompletion?) {
        self.filter = filter
        self.completion = completion
    }
    
    //MARK: - main
    weak var view: FilterViewInput? {
        didSet {
            setupView()
        }
    }
    
    fileprivate var filter = SourcesFilter.default
    fileprivate var completion: (FilterModuleInputCompletion)?

    fileprivate let categories: [Category] = [.business, .entertainment, .gaming, .general, .music, .politics, .scienceAndNature, .sport, .technology, .all]
    fileprivate let languages: [Language] = [.de, .en, .fr, .all]
    fileprivate let countries: [Country] = [.au, .de, .gb, .in, .it, .us, .all]
    
    
    fileprivate func setupView() {

        view?.onViewDidLoad = { [weak self] in
            self?.view?.setTitle("Filter")
            guard let filterViewItem = self?.createFilterViewItem() else { return }
            self?.view?.setData(filterViewItem)
        }
        
        view?.onDoneTap = { [weak self] in
            guard let filter = self?.filter else { return }
            self?.completion?(filter)
        }
        
    }
    
    
    fileprivate func createFilterViewItem() -> FilterViewItem {
        
        let categoriesSection = FilterViewItem.Section(title: "Category",
                                                       type: .category,
                                                       items: categories.map{
                                                        FilterViewItem.Section.Item(title: $0.rawValue,
                                                                                    selected: $0 == filter.category) })
        
        let languagesSection = FilterViewItem.Section(title: "Language",
                                                      type: .language,
                                                      items: languages.map{
                                                        FilterViewItem.Section.Item(title: $0.rawValue,
                                                                                    selected: $0 == filter.language) })
        
        let countriesSection = FilterViewItem.Section(title: "Country",
                                                      type: .country,
                                                      items: countries.map{
                                                        FilterViewItem.Section.Item(title: $0.rawValue,
                                                                                    selected: $0 == filter.country) })
        
        
        let filterViewItem = FilterViewItem(sections: [categoriesSection, languagesSection, countriesSection],
                                           onSelectItem: { [weak self] itemType, value in
                                            switch itemType {
                                            case .category: self?.filter.category = Category(rawValue: value) ?? .all
                                            case .language: self?.filter.language = Language(rawValue: value) ?? .all
                                            case .country: self?.filter.country = Country(rawValue: value) ?? .all
                                            }
                                            
                                            guard let filterViewItem = self?.createFilterViewItem() else { return }
                                            
                                            self?.view?.setData(filterViewItem)
        })

        return filterViewItem
    }
    
    
    
}
