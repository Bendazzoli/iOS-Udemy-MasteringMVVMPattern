//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Paulo Henrique Bendazzoli on 01/08/22.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=br&category=sports&apiKey=22ce9b387c4d451b8896c77511a6b35c")
        guard let validURL = url else { return }
        WebService().getArticles(url: validURL) { articles in
            print(articles)
        }
    }
}
