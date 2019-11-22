//
//  SettingViewModel.swift
//  GoodWeather_MVVM
//
//  Created by DONGGUN LEE on 11/21/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import Foundation

enum TemperatureUnit:String, CaseIterable {
    
    case celsius = "metric"
    case fahrenheit = "imperial"
}

extension TemperatureUnit{
    var displayName:String{
        get{
            switch(self){
            case .celsius:
                return "Celsius"
            case .fahrenheit:
                return "Fahrenheit"
            }
        }
    }
}

struct SettingViewModel{
    let units = TemperatureUnit.allCases
    private var _selectedUnit: TemperatureUnit = TemperatureUnit.fahrenheit
    
    var selectedTemperatureUnit: TemperatureUnit{
        get{
            if let value = UserDefaults.standard.value(forKey: "temperatureUnit") as? String{
                return TemperatureUnit(rawValue: value)!
            }
            
            return _selectedUnit
        }
        set (newValue){
            UserDefaults.standard.set(newValue.rawValue, forKey: "temperatureUnit")
        }
    }
}
