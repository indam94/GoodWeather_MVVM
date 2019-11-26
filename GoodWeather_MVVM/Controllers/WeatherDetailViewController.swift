//
//  WeatherDetailViewController.swift
//  GoodWeather_MVVM
//
//  Created by DONGGUN LEE on 11/25/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import UIKit

class WeatherDetailViewController: UIViewController {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var minTemperatureLabel: UILabel!
    @IBOutlet weak var maxTemperatureLable: UILabel!
    
    var weatherVM: WeatherViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let weatherVM = self.weatherVM{
            
            self.cityNameLabel.text = weatherVM.name.value
            self.currentTemperatureLabel.text = weatherVM.currentTemperature.temperature.value.formatAsDegree
            
            
            
        }

        // Do any additional setup after loading the view.
        
    }
    
    

}
