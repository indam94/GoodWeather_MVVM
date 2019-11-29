//
//  SettingsViewModelTest.swift
//  GoodWeather_MVVMTests
//
//  Created by DONGGUN LEE on 11/29/19.
//  Copyright © 2019 DONGGUN LEE. All rights reserved.
//

import XCTest
@testable import GoodWeather_MVVM

class SettingsViewModelTest: XCTestCase {
    
    private var settingsVM: SettingViewModel!
    
    override func setUp() {
        super.setUp()
        
        settingsVM = SettingViewModel()
    }
    
    func test_should_return_correct_display_name_for_fahrenheit(){
        XCTAssertEqual(settingsVM.selectedTemperatureUnit.displayName, "Fahrenheit");
    }

    func test_should_make_sure_that_default_selected_unit_is_fahrenheit(){
        
        XCTAssertEqual(settingsVM.selectedTemperatureUnit, .fahrenheit)
        
    }

    func test_should_be_able_to_save_user_unit_selection(){
        self.settingsVM.selectedTemperatureUnit = .celsius
        let userDefault = UserDefaults.standard
        XCTAssertNotNil(userDefault.value(forKey: "temperatureUnit"))
    }
    
    override func tearDown() {
        super.tearDown()
        
        let userDefault = UserDefaults.standard
        userDefault.removeObject(forKey: "temperatureUnit")
    }
}
