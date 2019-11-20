//
//  WeatherListTableCell.swift
//  GoodWeather_MVVM
//
//  Created by DONGGUN LEE on 11/15/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import UIKit

class WeatherListTableCell:UITableViewCell{
    
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    func configure(_ vm: WeatherViewModel){
        self.cityNameLabel.text = vm.name
        self.temperatureLabel.text = vm.currentTemperature.temperature.formatAsDegree
    }
}
