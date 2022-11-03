//
//  WeatherListTableViewController.swift
//  GoodWeather
//
//  Created by Paulo Henrique Bendazzoli on 14/09/22.
//

import UIKit

class WeatherListTableViewController: UITableViewController, AddWeatherDelegate, SettingsDelegate {

    // MARK: Properties

    private var weatherListViewModel = WeatherListViewModel()

    // MARK: - App Lifecicle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - Delegate's Funcs

    func addWeatherDidSave(weatherVM: WeatherViewModel) {
        weatherListViewModel.addWeatherViewModel(weatherVM)
        self.tableView.reloadData()
    }

    func settingsDone(settingsVM: SettingsViewModel) {
        print("disparou o settingsDone")
    }

    // MARK: - Table View Datasource

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        weatherListViewModel.numberOfRows(section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as! WeatherCell

        cell.configure(weatherListViewModel.modelAt(indexPath.row))
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddWeatherCityViewController" {
            prepareSegueForAddWeatherCityViewController(segue: segue)
        } else if segue.identifier == "SettingsTableViewController" {
            prepareSegueForSettingsViewController(segue: segue)
        }
    }

    private func prepareSegueForAddWeatherCityViewController(segue: UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }

        guard let addWeatherCityVC = nav.viewControllers.first as? AddWeatherCityViewController else {
            fatalError("AddWeatherViewController not found")
        }

        addWeatherCityVC.delegate = self
    }

    private func prepareSegueForSettingsViewController(segue: UIStoryboardSegue) {
        guard let nav = segue.destination as? UINavigationController else {
            fatalError("NavigationController not found")
        }

        guard let settingsVC = nav.viewControllers.first as? SettingsTableViewController else {
            fatalError("SettingsTableViewController not found")
        }

        settingsVC.delegate = self
    }



    // MARK: - Table View Delegate

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}
