//
//  WeatherListViewModelTest.swift
//  GoodWeather_MVVMTests
//
//  Created by DONGGUN LEE on 11/29/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import XCTest
@testable import GoodWeather_MVVM

class WeatherListViewModelTest: XCTestCase {

    private var weatherListVM: WeatherListViewModel!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        self.weatherListVM = WeatherListViewModel()
        
        self.weatherListVM.addWeatherViewModel(WeatherViewModel(name: "Seoul", currentTemperature: TemperatureViewModel(temperature:32, temperatureMin:0, temperatureMax:0)))
        
    }
    
    func test_should_be_able_to_convert_to_celcius_successfully(){
        
    }
    

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

}
