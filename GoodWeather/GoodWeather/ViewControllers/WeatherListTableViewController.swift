//
//  WeatherListTableViewController.swift
//  GoodWeather
//
//  Created by Paulo Henrique Bendazzoli on 14/09/22.
//

import UIKit

class WeatherListTableViewController: UITableViewController {

    // MARK: - App Lifecicle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - Table View Datasource

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as! WeatherCell
        cell.cityNameLabel.text = "Houston"
        cell.temperatureLabel.text = "30º"
        return cell
    }

    // MARK: - Table View Delegate

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}
