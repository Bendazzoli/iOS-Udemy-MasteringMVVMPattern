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
    }
}
