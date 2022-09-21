//
//  WeatherService.swift
//  GoodWeather
//
//  Created by Paulo Henrique Bendazzoli on 21/09/22.
//

import UIKit

final class WeatherService {

    func load<T>(resource: WeatherResource<T>, completion: @escaping (T?) -> ()){
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            if let data = data {
                DispatchQueue.main.async {
                    completion(resource.parse(data))
                }
            } else {
                completion(nil)
            }
        }.resume()
    }
}
