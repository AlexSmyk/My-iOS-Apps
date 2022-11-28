//
//  WeatherDataNew.swift
//  WeatherForecast
//
//  Created by Алекс Смык on 21.11.22.
//

import Foundation

// MARK: - WeatherData
struct WeatherData: Codable {
    let city, temperature, weatherDataNewDescription: String
    let weatherPerDay: [WeatherPerDay]
    let forecast: [Forecast]

    enum CodingKeys: String, CodingKey {
        case city, temperature
        case weatherDataNewDescription = "description"
        case weatherPerDay = "weather_per_day"
        case forecast
    }
}

// MARK: - Forecast
struct Forecast: Codable {
    let date: String
    let minTemperature, maxTemperature: Int
    let weatherType: String

    enum CodingKeys: String, CodingKey {
        case date
        case minTemperature = "min_temperature"
        case maxTemperature = "max_temperature"
        case weatherType = "weather_type"
    }
}

// MARK: - WeatherPerDay
struct WeatherPerDay: Codable {
    let timestamp, weatherType, temperature: String
    let sunset: Bool?

    enum CodingKeys: String, CodingKey {
        case timestamp
        case weatherType = "weather_type"
        case temperature, sunset
    }
}
