//
//  AddWeatherCityViewController.swift
//  GoodWeather
//
//  Created by Paulo Henrique Bendazzoli on 14/09/22.
//

import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(weatherVM: WeatherViewModel)
}

class AddWeatherCityViewController: UIViewController {

    // MARK: Properties

    private var addWeatherViewModel = AddWeatherViewModel()
    var delegate: AddWeatherDelegate?

    // MARK: Outlets

    @IBOutlet weak var cityNameTextfield: UITextField!

    // MARK: Actions

    @IBAction func saveCityButtonPressed(_ sender: Any) {
        if let city = cityNameTextfield.text {
            addWeatherViewModel.addWeather(for: city) { (weatherVM) in
                self.delegate?.addWeatherDidSave(weatherVM: weatherVM)
                self.dismiss(animated: true, completion: nil)
            }
        }
    }

    @IBAction func closeCityButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }

}
