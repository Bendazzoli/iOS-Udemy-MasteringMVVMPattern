//
//  Double+Extensions.swift
//  GoodWeather
//
//  Created by Paulo Henrique Bendazzoli on 03/11/22.
//

import Foundation

extension Double {

    func formatAsDegree() -> String {
        String(format: "%.2fº", self)
    }
}
