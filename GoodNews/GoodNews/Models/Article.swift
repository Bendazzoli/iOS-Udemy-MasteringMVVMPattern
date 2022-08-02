//
//  Article.swift
//  GoodNews
//
//  Created by Paulo Henrique Bendazzoli on 01/08/22.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]?
}

struct Article: Decodable {
    let title: String?
    let description: String?
}
