//
//  ArticlesPresenter.swift
//  tutuTest
//
//  Created by Станислав Сарычев on 27.06.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import Foundation
import UIKit

final class ArticlesPresenter: ArticlesModuleInput, ArticlesViewOutput {
    
    //MARK: - ArticlesModuleInput
    func setupWith(source: String, title: String) {
        self.source = source
        self.title = title
    }
    
    
    //MARK: - main
    weak var view: ArticlesViewInput? {
        didSet {
            setupView()
        }
    }
    fileprivate let interactor: ArticlesInteractorInput
    
    fileprivate var source = "the-next-web"
    fileprivate var title = "Articles"
    
    init(interactor: ArticlesInteractorInput) {
        self.interactor = interactor
    }
    
    fileprivate func setupView() {
        
        view?.onViewDidLoad = { [weak self] in
            guard let source = self?.source, let title = self?.title else { return }
            self?.view?.setTitle(title)
            self?.view?.showLoading()
            self?.interactor.fetchArticles(withSource: source, completion: { articleItems in
                guard let articleViewItems = self?.articlesViewItemsFromArticlesItems(articleItems) else { return }
                self?.view?.setData(articleViewItems)
            })
        }
    }
    
    
    fileprivate func articlesViewItemsFromArticlesItems(_ articleItems: [ArticleItem]) -> [ArticlesViewItem] {
        return articleItems.map { articlesViewItemFromArticlesItem($0) }
    }
    
    fileprivate func articlesViewItemFromArticlesItem(_ articleItem: ArticleItem) -> ArticlesViewItem {
        return ArticlesViewItem(title: articleItem.title,
                                author: articleItem.author,
                                imageURL: articleItem.imageURL,
                                onSelectArticle: {
                                    UIApplication.shared.open(articleItem.articleURL, options: [:], completionHandler: nil)
                                    
        })
    }

    
    
}
