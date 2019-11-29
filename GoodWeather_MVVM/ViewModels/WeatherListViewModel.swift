//
//  WeatherListViewModel.swift
//  GoodWeather_MVVM
//
//  Created by DONGGUN LEE on 11/19/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import Foundation

class WeatherListViewModel{
    
    private(set) var weatherViewModels = [WeatherViewModel]()
    
    func addWeatherViewModel(_ vm: WeatherViewModel){
        self.weatherViewModels.append(vm)
    }
    
    func numberOfRows(_ section: Int )-> Int{
        return self.weatherViewModels.count
    }
    
    func modelAt(_ index: Int) -> WeatherViewModel{
        return self.weatherViewModels[index]
    }
    
    private func toCelsius(){
        weatherViewModels = weatherViewModels.map{ vm in
            let weatherModel = vm
            weatherModel.currentTemperature.temperature.value = (weatherModel.currentTemperature.temperature.value - 32) * 5/9
            return weatherModel
        }
    }
    
    private func toFahrenheit(){
       weatherViewModels = weatherViewModels.map{ vm in
           let weatherModel = vm
        weatherModel.currentTemperature.temperature.value = (weatherModel.currentTemperature.temperature.value * 9/5) + 32
           return weatherModel
       }
    }
    
    func updateUnit(to unit: TemperatureUnit){
        switch unit {
        case .celsius:
            toCelsius()
        case .fahrenheit:
            toFahrenheit()
            
        }
    }
}

//Type Eraser

class Dynamic<T>: Decodable where T: Decodable{
    typealias Listener = (T) -> ()
    var listener: Listener?
    
    var value: T{
        didSet{
            listener?(value)
        }
    }
    
    func bind(listener: @escaping Listener){
        self.listener = listener
        self.listener?(self.value)
    }
    
    init(_ value: T){
        self.value = value
    }
    
    private enum CodingKeys: CodingKey{
        case value
    }
}

struct WeatherViewModel: Decodable{
    
    let name: Dynamic<String>
    var currentTemperature: TemperatureViewModel
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = Dynamic(try container.decode(String.self, forKey: .name))
        currentTemperature = try container.decode(TemperatureViewModel.self, forKey: .currentTemperature)
    }

    private enum CodingKeys: String, CodingKey{
        case name
        case currentTemperature = "main"
    }
}
