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
    private var dataSource: WeatherDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.dataSource = WeatherDataSource(self.weatherListVM)
        self.tableView.dataSource = self.dataSource
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func addWeatherDidSave(vm: WeatherViewModel) {
        self.weatherListVM.addWeatherViewModel(vm)
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "AddCityViewController"{
            self.prepareSegueForAddCityViewController(segue: segue)
        }
        
        else if segue.identifier == "SettingTableViewController"{
            self.prepareSegueForSettingTableViewController(segue: segue)
        }
        
        else if segue.identifier == "WeatherDetailViewController" {
            self.prepareSegueForWeatherDetailViewController(segue: segue)
        }
        
    }
    
    private func prepareSegueForAddCityViewController(segue: UIStoryboardSegue){
        
        guard let nav = segue.destination as? UINavigationController else{
            fatalError("NavigationController Not Found")
        }
       
        guard let addWeatherCityVC = nav.viewControllers.first as? AddCityViewController else{
            fatalError("AddWeatherCityViewController Not Found")
        }
       
        addWeatherCityVC.delegate = self
    }
    
    private func prepareSegueForSettingTableViewController(segue: UIStoryboardSegue){
        
        guard let nav = segue.destination as? UINavigationController else{
             fatalError("NavigationController Not Found")
         }
        
         guard let settingVC = nav.viewControllers.first as? SettingTableViewController else{
             fatalError("SettingTableViewController Not Found")
         }
        
         settingVC.delegate = self
        
    }
    
    private func prepareSegueForWeatherDetailViewController(segue: UIStoryboardSegue){
        
        guard let weatherDetailVC = segue.destination as? WeatherDetailViewController,
            let indexPath = self.tableView.indexPathForSelectedRow
        else{
            return
        }
        let weatherVM = self.weatherListVM.modelAt(indexPath.row)
        weatherDetailVC.weatherVM = weatherVM
        
    }
}

extension WeatherListTableViewController: SettingDelegate{
    func settingDone(vm: SettingViewModel) {
        
        self.weatherListVM.updateUnit(to: vm.selectedTemperatureUnit)
        self.tableView.reloadData()
    }
}
