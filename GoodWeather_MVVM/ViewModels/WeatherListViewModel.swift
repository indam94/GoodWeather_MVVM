//
//  WeatherListViewModel.swift
//  GoodWeather_MVVM
//
//  Created by DONGGUN LEE on 11/19/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import Foundation

struct WeatherListViewModel{
    
    private var weatherViewModels = [WeatherViewModel]()
    
    mutating func addWeatherViewModel(_ vm: WeatherViewModel){
        self.weatherViewModels.append(vm)
    }
    
    func numberOfRows(_ section: Int )-> Int{
        return self.weatherViewModels.count
    }
    
    func modelAt(_ index: Int) -> WeatherViewModel{
        return self.weatherViewModels[index]
    }
    
}

struct WeatherViewModel: Codable{
    
    let name: String
    let currentTemperature: TemperatureViewModel

    private enum CodingKeys: String, CodingKey{
        case name
        case currentTemperature = "main"
    }
}
