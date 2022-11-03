//
//  WeatherCell.swift
//  GoodWeather
//
//  Created by Paulo Henrique Bendazzoli on 16/09/22.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!

    func configure(_ weatherVM: WeatherViewModel) {
        self.cityNameLabel.text = weatherVM.city
        self.temperatureLabel.text = "\(weatherVM.temperature.formatAsDegree())"
    }
}
