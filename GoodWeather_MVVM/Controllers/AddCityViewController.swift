//
//  AddCityViewController.swift
//  GoodWeather_MVVM
//
//  Created by DONGGUN LEE on 11/15/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import UIKit

class AddCityViewController: UIViewController{
    
    @IBOutlet weak var cityNameTextField: UITextField!
    
    @IBAction func saveCity(_ sender: Any) {
        if let city = cityNameTextField.text{
            
            if let weatherURL = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(API_KEY)&units=imperial"){
                
                let weatherResource = Resource<Any>(url: weatherURL){ data in
                    
                    return data
                }
                
                WebService().load(resource: weatherResource){ result in
                    
                }
            }
            
        }
    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
