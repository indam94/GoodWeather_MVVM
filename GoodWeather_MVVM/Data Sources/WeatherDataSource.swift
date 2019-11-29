//
//  WeatherDataSource.swift
//  GoodWeather_MVVM
//
//  Created by DONGGUN LEE on 11/28/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import UIKit

class WeatherDataSource: NSObject, UITableViewDataSource{
    
    let cellIdentifier: String = "WeatherListTableCell"
    
    private var weatherListVM: WeatherListViewModel
    
    init(_ weatherListVM: WeatherListViewModel){
        self.weatherListVM = weatherListVM
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherListVM.weatherViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? WeatherListTableCell else{
            fatalError("Cell Error")
        }
        let weatherVM = self.weatherListVM.modelAt(indexPath.row)
        cell.cityNameLabel.text = weatherVM.name.value
        cell.temperatureLabel.text = weatherVM.currentTemperature.temperature.value.formatAsDegree
        return cell
    }
    
    
}
