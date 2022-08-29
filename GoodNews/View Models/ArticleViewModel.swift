//
//  ArticleViewModel.swift
//  GoodNews
//
//  Created by Nalinda Wickramarathna on 2022-08-29.
//

import Foundation

// Represent a single Article
struct ArticleViewModel {
    private let article: Article
    
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    
    var title: String {
        return self.article.title
    }
    
    var description: String? {
        return self.article.description
    }
}
