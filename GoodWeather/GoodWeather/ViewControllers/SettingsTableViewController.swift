//
//  SettingsTableViewController.swift
//  GoodWeather
//
//  Created by Paulo Henrique Bendazzoli on 03/11/22.
//

import Foundation
import UIKit

protocol SettingsDelegate {
    func settingsDone(settingsVM: SettingsViewModel)
}

class SettingsTableViewController: UITableViewController {

    private var settingsVM = SettingsViewModel()
    var delegate: SettingsDelegate?

    @IBAction func done() {
        if let delegate = delegate {
            delegate.settingsDone(settingsVM: settingsVM)
        }

        self.dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        settingsVM.units.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingsItem = settingsVM.units[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath)
        cell.textLabel?.text = settingsItem.displayName

        if settingsItem == settingsVM.selectedUnit {
            cell.accessoryType = .checkmark
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // uncheck all cells
        tableView.visibleCells.forEach { cell in
            cell.accessoryType = .none
        }

        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
            let unit = Unit.allCases[indexPath.row]
            settingsVM.selectedUnit = unit
        }
    }

    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
    }
}
