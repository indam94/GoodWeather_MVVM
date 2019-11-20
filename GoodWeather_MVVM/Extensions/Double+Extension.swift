//
//  Double+Extension.swift
//  GoodWeather_MVVM
//
//  Created by DONGGUN LEE on 11/19/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import Foundation

extension Double{
    var formatAsDegree: String{
        return String(format: "%.0f°", self)
    }
}
