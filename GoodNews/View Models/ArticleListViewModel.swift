//
//  ArticleListViewModel.swift
//  GoodNews
//
//  Created by Nalinda Wickramarathna on 2022-08-29.
//

import Foundation

// Represent a list of Articles / represent the entire articles screen
struct ArticleListViewModel {
    let articles: [Article]
}

extension ArticleListViewModel {
    var numberOfSections: Int {
        return 1
    }
    
    // section will ignore in this example
    func numberOfRowsInSection(_ section: Int) -> Int {
        return articles.count
    }
    
    func articleVMAtIndex(_ index: Int) -> ArticleViewModel {
        let article = articles[index]
        return ArticleViewModel(article)
    }
}
