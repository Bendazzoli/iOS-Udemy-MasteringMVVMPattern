//
//  AddWeatherViewModel.swift
//  GoodWeather
//
//  Created by Paulo Henrique Bendazzoli on 03/11/22.
//

import Foundation

class AddWeatherViewModel {

    func addWeather(for city: String, completion: @escaping (WeatherViewModel) -> Void) {

        let weatherURL = Constants.URLs.urlForWeatherbtCity(city: city)

        let waetherResource = WeatherResource<WeatherResponse>(url: weatherURL) { data in
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            return weatherResponse
        }

        WeatherService().load(resource: waetherResource) { result in
            if let weatherResource = result {
                let weatherViewModel = WeatherViewModel(weather: weatherResource)
                completion(weatherViewModel)
            }
        }
    }
}
