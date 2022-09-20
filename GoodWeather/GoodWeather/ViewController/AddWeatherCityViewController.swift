//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by Paulo Henrique Bendazzoli on 14/09/22.
//

import UIKit

class AddWeatherCityViewController: UIViewController {

    @IBOutlet weak var cityNameTextfield: UITextField!

    @IBAction func saveCityButtonPressed(_ sender: Any) {
    }

    @IBAction func closeCityButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }

}
