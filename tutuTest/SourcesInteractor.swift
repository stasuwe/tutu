//
//  SourcesInteractor.swift
//  tutuTest
//
//  Created by Станислав Сарычев on 26.06.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import Foundation

final class SourcesInteractor: SourcesInteractorInput {
    
    fileprivate let urlSession = URLSession(configuration: URLSessionConfiguration.default)
    fileprivate let sourcesURL = "https://newsapi.org/v1/sources"
    
    
    func fetchSources(withFilter filter: SourcesFilter, completion: @escaping FetchCompletion) {
        
        guard let requestUrl = requestURLWithFilter(filter) else { completion([]); return }

        urlSession.dataTask(with: requestUrl, completionHandler: { data, response, error in
            if error != nil {
                completion([]); return
            }
            
            guard let data = data,
                let jsonResponse = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any],
                let jsonArray = jsonResponse["sources"] as? [[String: Any]]
                else { completion([]); return }
            
            var sourcesItems = [SourcesItem]()
            for json in jsonArray {
                let item = SourcesItem(json: json)
                if item != nil {
                    sourcesItems.append(item!)
                } else {
                    sourcesItems.removeAll()
                    break
                }
            }
            completion(sourcesItems)
        }).resume()
        
    }
    
    fileprivate func requestURLWithFilter(_ filter: SourcesFilter) -> URL? {
        guard var urlComponents = URLComponents(string: sourcesURL) else { return nil }
        
        let categoryQuery = URLQueryItem(name: "category",
                                         value: filter.category == .all ? nil : filter.category.rawValue)
        let languageQuery = URLQueryItem(name: "language",
                                         value: filter.language == .all ? nil : filter.language.rawValue)
        let countryQuery = URLQueryItem(name: "country",
                                        value: filter.country == .all ? nil : filter.country.rawValue)
        
        urlComponents.queryItems = [categoryQuery, languageQuery, countryQuery]
        
        return urlComponents.url
    }
    
}
