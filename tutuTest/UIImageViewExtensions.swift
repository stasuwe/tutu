//
//  UIImageView+LoadFromURL.swift
//  tutuTest
//
//  Created by Станислав Сарычев on 27.06.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func loadImageFrom(_ url: URL) {
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            URLSession.shared.dataTask(with: url, completionHandler: { data, response, error in
                guard error == nil,
                    let data = data,
                    let response = response,
                    let image = UIImage(data: data)
                    else { return }
                
                if response.url == url {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }).resume()

        }
    }
    
    
}
