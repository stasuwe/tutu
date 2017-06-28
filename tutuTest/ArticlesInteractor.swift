//
//  ArticlesInteractor.swift
//  tutuTest
//
//  Created by Станислав Сарычев on 27.06.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import Foundation

final class ArticlesInteractor: ArticlesInteractorInput {
    
    fileprivate let urlSession = URLSession(configuration: URLSessionConfiguration.default)
    fileprivate let sourcesURL = "https://newsapi.org/v1/articles"
    fileprivate let apiKey = "4cd458fbc9d749ab8a6b04e913d06b79"
    
    func fetchArticles(withSource source: String, completion: @escaping FetchCompletion) {
    
        guard let requestUrl = requestURLWithSource(source, apiKey: apiKey) else { completion([]); return }
        
        urlSession.dataTask(with: requestUrl, completionHandler: { data, response, error in
            if error != nil {
                completion([]); return
            }
            
            guard let data = data,
                let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any],
                let jsonArray = jsonResponse["articles"] as? [[String: Any]]
                else { completion([]); return }
            
            var articleItems = [ArticleItem]()
            for json in jsonArray {
                let item = ArticleItem(json: json)
                if item != nil {
                    articleItems.append(item!)
                } else {
                    articleItems.removeAll()
                    break
                }
            }
            completion(articleItems)
        }).resume()
        
    }
    
    fileprivate func requestURLWithSource(_ source: String, apiKey key: String) -> URL? {
        guard var urlComponents = URLComponents(string: sourcesURL) else { return nil }
        
        let sourceQuery = URLQueryItem(name: "source", value: source)
        let apiKeyQuery = URLQueryItem(name: "apiKey", value: key)

        urlComponents.queryItems = [sourceQuery, apiKeyQuery]
        
        return urlComponents.url
    }


}
