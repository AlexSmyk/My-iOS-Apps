//
//  GetCitiesWeather.swift
//  Weather
//
//  Created by Алекс Смык on 30.07.22.
//

import Foundation
import CoreLocation

let networkWeatherManager = NetworkWeatherManager()

func getCityWeather(citiesArray: [String], completionHandler: @escaping(Int, Weather)-> (Void)) {
    
    for (index, item) in citiesArray.enumerated() {
        getCoordinatesFrom(city: item) { coordinate, error in
            guard let coordinate = coordinate, error == nil else {
                return
            }
            print(coordinate)
            print(error?.localizedDescription as Any)
            networkWeatherManager.fetchWeather(latitude: coordinate.latitude, longtitude: coordinate.longitude) { weather in
                completionHandler(index,weather)
            }
        }
    }
}


func getCoordinatesFrom(city: String, completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> Void) {
    
    CLGeocoder().geocodeAddressString(city) { placemark, error in
        completion(placemark?.first?.location?.coordinate, error)
        
        }
        
    }


