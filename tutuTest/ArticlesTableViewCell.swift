//
//  ArticlesTableViewCell.swift
//  tutuTest
//
//  Created by Станислав Сарычев on 27.06.17.
//  Copyright © 2017 Станислав Сарычев. All rights reserved.
//

import UIKit

class ArticlesTableViewCell: UITableViewCell {

    var articleItem: ArticlesViewItem? {
        didSet {
            if let articleItem = articleItem {
                articleTitle.text = articleItem.title
                articleAuthor.text = articleItem.author
                articleImageView.loadImageFrom(articleItem.imageURL)
            }
        }
    }
    
    
    fileprivate let articleImageView = UIImageView(frame: .zero)
    fileprivate let articleTitle = UILabel(frame: .zero)
    fileprivate let articleAuthor = UILabel(frame: .zero)
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        articleImageView.image = UIImage(named: "imagePlaceholder")
        articleImageView.contentMode = .scaleAspectFill
        articleImageView.clipsToBounds = true
        
        contentView.addSubview(articleImageView)
        articleImageView.translatesAutoresizingMaskIntoConstraints = false
        articleImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        articleImageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        articleImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
        articleImageView.widthAnchor.constraint(equalTo: articleImageView.heightAnchor, multiplier: 1).isActive = true
        
        articleTitle.numberOfLines = 0
        contentView.addSubview(articleTitle)
        articleTitle.translatesAutoresizingMaskIntoConstraints = false
        articleTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        articleTitle.leadingAnchor.constraint(equalTo: articleImageView.trailingAnchor, constant: 8).isActive = true
        articleTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        
        articleAuthor.font = UIFont.systemFont(ofSize: 13)
        articleAuthor.textColor = .lightGray
        contentView.addSubview(articleAuthor)
        articleAuthor.translatesAutoresizingMaskIntoConstraints = false
        articleAuthor.topAnchor.constraint(lessThanOrEqualTo: articleTitle.bottomAnchor, constant: 16).isActive = true
        articleAuthor.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
        articleAuthor.leadingAnchor.constraint(equalTo: articleImageView.trailingAnchor, constant: 8).isActive = true
        articleAuthor.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        articleItem = nil
        articleImageView.image = UIImage(named: "imagePlaceholder")
    }
    
}
