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
    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
