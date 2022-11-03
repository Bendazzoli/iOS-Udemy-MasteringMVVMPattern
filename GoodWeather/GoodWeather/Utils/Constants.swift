//
//  Constants.swift
//  GoodWeather
//
//  Created by Paulo Henrique Bendazzoli on 03/11/22.
//
import Foundation
import UIKit

struct Constants {

    struct URLs {
        static func urlForWeatherbtCity(city: String) -> URL {
            let userDefaults = UserDefaults.standard
            let unit = (userDefaults.value(forKey: "unit") as? String) ?? Unit.fahrenheit.rawValue

            return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city.escaped())&APPID=a1317abf7934b3f6bb510f4d40b7cf0d&units=\(unit)")!
        }
    }
}
