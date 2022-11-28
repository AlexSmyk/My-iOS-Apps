//
//  WeatherPresenter.swift
//  WeatherApp
//
//  Created by Алекс Смык on 20.11.22.
//

import Foundation


class WeatherPresenter: WeatherViewOutput {
    
    
    weak var view: WeatherViewInput!
    var dataManager: DataManager!
    let jsonFileName = "TestTaskJSON"
    
    func getWeatherData() {
        
        let data = dataManager.parseJson(filename: jsonFileName)
        view.showDailyData(data!)
        
    }
}
