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
}
