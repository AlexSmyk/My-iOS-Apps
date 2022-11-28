//
//  WeatherDataManager.swift
//  WeatherApp
//
//  Created by Алекс Смык on 20.11.22.
//

import Foundation


protocol DataManager {
    func obtainWeatherData() -> [Int]
    func parseJson(filename fileName: String) -> WeatherData?
}

class WeatherDataManager: DataManager {
    
    func parseJson(filename fileName: String) -> WeatherData? {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(WeatherData.self, from: data)
                return jsonData
            } catch {
                print("error:\(error)")
            }
        }
        return nil
    }
}
