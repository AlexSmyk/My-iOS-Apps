//
//  WeatherViewInput.swift
//  WeatherApp
//
//  Created by Алекс Смык on 20.11.22.
//

import Foundation

//call inside view
protocol WeatherViewInput: AnyObject {

    func showDailyData(_ data: WeatherData)
}
