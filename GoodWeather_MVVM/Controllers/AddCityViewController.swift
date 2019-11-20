//
//  AddCityViewController.swift
//  GoodWeather_MVVM
//
//  Created by DONGGUN LEE on 11/15/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import UIKit

protocol AddWeatherDelegate {
    func addWeatherDidSave(vm: WeatherViewModel)
}

class AddCityViewController: UIViewController{
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    var delegate: AddWeatherDelegate?
    
    @IBAction func saveCity(_ sender: Any) {
        if let city = cityNameTextField.text{
            
            if let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(API_KEY)&units=imperial"){
                
                let weatherResource = Resource<WeatherViewModel>(url: weatherURL){ data in
                    
                    let weatherVM = try? JSONDecoder().decode(WeatherViewModel.self, from : data)

                        return weatherVM
                }
                
                WebService().load(resource: weatherResource){[weak self] result in
                    if let weatherVM = result {
                        
                        if let delegate = self?.delegate{
                            delegate.addWeatherDidSave(vm: weatherVM)
                            self?.dismiss(animated: true, completion: nil)
                        }
                        
                    }
                }
            }
            
        }
    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
