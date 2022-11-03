//
//  WeatherListViewModel.swift
//  GoodWeather
//
//  Created by Paulo Henrique Bendazzoli on 03/11/22.
//

class WeatherListViewModel {
    
}

class WeatherViewModel {
    let weather: WeatherResponse

    init(weather: WeatherResponse) {
        self.weather = weather
    }

    var city: String {
        weather.name ?? "Error City"
    }

    var temperature: Double {
        weather.main?.temp ?? 999.9
    }
}
