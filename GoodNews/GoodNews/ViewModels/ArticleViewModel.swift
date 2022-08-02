//
//  ArticleViewModel.swift
//  GoodNews
//
//  Created by Paulo Henrique Bendazzoli on 01/08/22.
//

import Foundation

struct ArticleListViewModel {
    let articles: [Article]
}

extension ArticleListViewModel {
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
}

struct ArticleViewModel {
    private let article: Article
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

extension ArticleViewModel {
    var title: String {
        self.article.title ?? "WARNING: NO TITLE"
    }

    var description: String {
        self.article.description ?? "WARNING: NO DESCRIPTION"
    }
}
