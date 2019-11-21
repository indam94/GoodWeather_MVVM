//
//  WeatherListTableViewController.swift
//  GoodWeather_MVVM
//
//  Created by DONGGUN LEE on 11/15/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import UIKit

class WeatherListTableViewController: UITableViewController, AddWeatherDelegate{
    
    private var weatherListVM = WeatherListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weatherListVM.numberOfRows(section);
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherListTableCell", for: indexPath) as! WeatherListTableCell
        
        let weatherVM = self.weatherListVM.modelAt(indexPath.row)
        cell.configure(weatherVM)
        
        return cell
    }
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        self.weatherListVM.addWeatherViewModel(vm)
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddCityViewController"{
            self.prepareSeagueForAddCityViewController(segue: segue)
        }
        
        else if segue.identifier == "SettingTableViewController"{
            self.prepareSeagueForSettingTableViewController(segue: segue)
        }
        
    }
    
    private func prepareSeagueForAddCityViewController(segue: UIStoryboardSegue){
        
        guard let nav = segue.destination as? UINavigationController else{
            fatalError("NavigationController Not Found")
        }
       
        guard let addWeatherCityVC = nav.viewControllers.first as? AddCityViewController else{
            fatalError("AddWeatherCityViewController Not Found")
        }
       
        addWeatherCityVC.delegate = self
    }
    
    private func prepareSeagueForSettingTableViewController(segue: UIStoryboardSegue){
        
    }
}
