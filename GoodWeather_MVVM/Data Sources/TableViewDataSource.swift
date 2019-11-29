//
//  TableViewDataSource.swift
//  GoodWeather_MVVM
//
//  Created by DONGGUN LEE on 11/28/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import UIKit

class TableViewDataSource<CellType, ViewModel>: NSObject, UITableViewDataSource where CellType: UITableViewCell{
    
    let cellIdentifier: String
    var items = [ViewModel]()
    let configureCell:(CellType, ViewModel) -> ()
    
    init(cellIdentifier: String, items:[ViewModel], configureCell: @escaping(CellType, ViewModel) -> ()){
        
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
        
    }
    
    func updateItem(_ items:[ViewModel]){
        self.items = items
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as? CellType else{
            fatalError("Cell With \(self.cellIdentifier) Error")
        }
        
        let vm = self.items[indexPath.row]
        self.configureCell(cell, vm)
        
        return cell
        
    }
    
    
}
