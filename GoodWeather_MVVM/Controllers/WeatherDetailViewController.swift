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
        
        setupVMBinding()
        
       
    }
    
    private func setupVMBinding(){
        if let weatherVM = self.weatherVM{
            weatherVM.name.bind{
                self.cityNameLabel.text = $0
            }
            weatherVM.currentTemperature.temperature.bind{
                self.currentTemperatureLabel.text = $0.formatAsDegree
            }
            weatherVM.currentTemperature.temperatureMin.bind{
                self.minTemperatureLabel.text = $0.formatAsDegree
            }
            weatherVM.currentTemperature.temperatureMax.bind{
                self.maxTemperatureLable.text = $0.formatAsDegree
            }
        }
        
//        DispatchQueue.main.asyncAfter(deadline: .now()+2.0){
//            self.weatherVM?.name.value = "Seoul"
//        }
    }

}
