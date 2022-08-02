//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Paulo Henrique Bendazzoli on 01/08/22.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    
    private var articleListViewModel: ArticleListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=br&category=sports&apiKey=22ce9b387c4d451b8896c77511a6b35c")
        guard let validURL = url else { return }
        WebService().getArticles(url: validURL) { articles in
            guard let articles = articles else { return }
            self.articleListViewModel = ArticleListViewModel(articles: articles)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension NewsListTableViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        self.articleListViewModel == nil ? 0 : self.articleListViewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.articleListViewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found")
        }
        let articleViewModel = self.articleListViewModel.articleAtIndex(indexPath.row)
        
        cell.titleLabel.text = articleViewModel.title
        cell.descriptionLabel.text = articleViewModel.description
        return cell
    }
}
