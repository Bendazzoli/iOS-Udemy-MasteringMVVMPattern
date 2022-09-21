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

        if let city = cityNameTextfield.text {
            let weatherUrl = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&APPID=a1317abf7934b3f6bb510f4d40b7cf0d&units=metric")!

            let resource = WeatherResource<WeatherResponse>(url: weatherUrl) { data in
                return try? JSONDecoder().decode(WeatherResponse.self, from: data)
            }

            WeatherService().load(resource: resource) { result in
                if let response = result {
                    print(response)
                }
            }
        }
    }

    @IBAction func closeCityButtonPressed(_ sender: Any) {
        self.dismiss(animated: true)
    }

}
