//
//  SourcesPresenter.swift
//  tutuTest
//
//  Created by Станислав Сарычев on 26.06.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import Foundation

final class SourcesPresenter: SourcesViewOutput, SourcesInteractorOutput {
    
    //MARK: - main
    weak var view: SourcesViewInput? {
        didSet {
            setupView()
        }
    }
    fileprivate let interactor: SourcesInteractorInput
    fileprivate let router: SourcesRouterInput
    
    fileprivate var filter = SourcesFilter.default
    
    init(interactor: SourcesInteractorInput, router: SourcesRouterInput) {
        self.interactor = interactor
        self.router = router
    }
    
    fileprivate func setupView() {
        
        view?.onViewDidLoad = { [weak self] in
            self?.view?.setTitle("Sources")
            self?.fetchSources()
        }
        
        view?.onFilterTap = { [weak self] in
            guard let filter = self?.filter else { return }
            self?.router.openFilterWithConfiguration(filter) { newFilter in
                self?.filter = newFilter
                self?.fetchSources()
            }
        }
    }
    
    
    fileprivate func fetchSources() {
        view?.showLoading()
        interactor.fetchSources(withFilter: filter, completion: { [weak self] sourcesItems in
            guard let sourcesViewItems = self?.sourcesViewItemsFromSourcesItems(sourcesItems) else { return }
            self?.view?.setData(sourcesViewItems)
        })

    }
    
    fileprivate func sourcesViewItemsFromSourcesItems(_ sourcesItems: [SourcesItem]) -> [SourcesViewItem] {
        return sourcesItems.map { sourcesViewItemFromSourcesItem($0) }
    }
    
    fileprivate func sourcesViewItemFromSourcesItem(_ sourcesItem: SourcesItem) -> SourcesViewItem {
        return SourcesViewItem(name: sourcesItem.name,
                               category: sourcesItem.category.rawValue,
                               description: sourcesItem.description,
                               onSelectSource: { [weak self] in
                                    self?.router.openArticlesForSource(sourcesItem.id, withTitle: sourcesItem.name)
        })
    }
    
}
