//
//  SettingTableViewController.swift
//  GoodWeather_MVVM
//
//  Created by DONGGUN LEE on 11/21/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import UIKit

protocol SettingDelegate {
    func settingDone(vm : SettingViewModel)
}

class SettingTableViewController: UITableViewController{
    
    private var settingViewModel = SettingViewModel()
    
    var delegate: SettingDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.settingViewModel.units.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath)
        
        let settingItem = self.settingViewModel.units[indexPath.row]
        cell.textLabel?.text = settingItem.displayName
        
        if settingItem == self.settingViewModel.selectedTemperatureUnit{
            cell.accessoryType = .checkmark
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // uncheck all cells
        tableView.visibleCells.forEach{ cell in
            cell.accessoryType = .none
        }
        
        if let cell = tableView.cellForRow(at: indexPath){
            cell.accessoryType = .checkmark
            let unit = TemperatureUnit.allCases[indexPath.row]
            self.settingViewModel.selectedTemperatureUnit = unit
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath){
            cell.accessoryType = .none
        }
    }
    
    @IBAction func close(_ sender: Any) {
        
        if let delegate = self.delegate{
            delegate.settingDone(vm: self.settingViewModel)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
}

