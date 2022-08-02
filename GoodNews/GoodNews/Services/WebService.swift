//
//  WebService.swift
//  GoodNews
//
//  Created by Paulo Henrique Bendazzoli on 01/08/22.
//

import Foundation

class WebService {
    
    func getArticles(url: URL, completion: @escaping ([Article]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                if let list = articleList {
                    completion(list.articles)
                }
            }
        }.resume()
    }
}
