//
//  WeatherModel.swift
//  GoodWeather
//
//  Created by Paulo Henrique Bendazzoli on 21/09/22.
//

import UIKit

struct WeatherResponse: Decodable {
    let main: WeatherModel?
    let name: String?
}

struct WeatherModel: Decodable {
    let temp: Double?
    let humidity: Double?
}
