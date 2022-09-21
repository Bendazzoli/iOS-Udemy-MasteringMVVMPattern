//
//  WeatherResource.swift
//  GoodWeather
//
//  Created by Paulo Henrique Bendazzoli on 21/09/22.
//

import UIKit

struct WeatherResource<T> {
    let url: URL
    let parse: (Data) -> T?
}
