//
//  TemperViewModel.swift
//  GoodWeather_MVVM
//
//  Created by DONGGUN LEE on 11/19/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import Foundation

struct TemperatureViewModel: Codable{
    var temperature: Double
    let temperatureMin: Double
    let temperatureMax: Double
    
    private enum CodingKeys: String, CodingKey{
        case temperature = "temp"
        case temperatureMin = "temp_min"
        case temperatureMax = "temp_max"
    }
}
