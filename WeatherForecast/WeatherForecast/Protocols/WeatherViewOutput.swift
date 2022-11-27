//
//  WeatherViewOutput.swift
//  WeatherApp
//
//  Created by Алекс Смык on 20.11.22.
//

import Foundation

//connection with presenter
protocol WeatherViewOutput: AnyObject {
    
    func getWeatherData()
}
