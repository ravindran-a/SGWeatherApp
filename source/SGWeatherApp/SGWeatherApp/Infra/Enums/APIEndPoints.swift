//
//  File.swift
//  SGWeatherApp
//
//  Created by Ravindran on 02/03/22.
//

import Foundation

struct APIEndPoints {
    
    static let API_BASE_URL: String = "https://api.weatherapi.com/v1"
    static let API_KEY: String = "522db6a157a748e2996212343221502"

    enum WeatherInfo {
        case getCityWeatherInformation(key: String, cityName: String, numberOfDays: Int = 7, airQualityInformation: String, alerts: String)
        
        var url: String {
            switch self {
            case .getCityWeatherInformation(let key, let cityName, let numberOfDays, let airQualityInformation, let alerts):
                return "/forecast.json?key=\(key)&q=\(cityName)&days=\(numberOfDays)&aqi=\(airQualityInformation)&alerts=\(alerts)"
            }
        }
    }
    
}
