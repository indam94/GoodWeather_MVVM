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
    
    mutating private func toCelsius(){
        weatherViewModels = weatherViewModels.map{ vm in
            var weatherModel = vm
            weatherModel.currentTemperature.temperature = (weatherModel.currentTemperature.temperature - 32) * 5/9
            return weatherModel
        }
    }
    
    mutating private func toFahrenheit(){
       weatherViewModels = weatherViewModels.map{ vm in
           var weatherModel = vm
           weatherModel.currentTemperature.temperature = (weatherModel.currentTemperature.temperature * 9/5) + 32
           return weatherModel
       }
    }
    
    mutating func updateUnit(to unit: TemperatureUnit){
        switch unit {
        case .celsius:
            toCelsius()
        case .fahrenheit:
            toFahrenheit()
            
        }
    }
}

struct WeatherViewModel: Codable{
    
    let name: String
    var currentTemperature: TemperatureViewModel

    private enum CodingKeys: String, CodingKey{
        case name
        case currentTemperature = "main"
    }
}
