//
//  WeatherListViewModel.swift
//  GoodWeather
//
//  Created by Paulo Henrique Bendazzoli on 03/11/22.
//

class WeatherListViewModel {
    private var weatherViewModels = [WeatherViewModel]()

    func addWeatherViewModel(_ vm: WeatherViewModel) {
        weatherViewModels.append(vm)
    }

    func numberOfRows(_ section: Int) -> Int {
        return weatherViewModels.count
    }

    func modelAt(_ index: Int) -> WeatherViewModel {
        return weatherViewModels[index]
    }
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
