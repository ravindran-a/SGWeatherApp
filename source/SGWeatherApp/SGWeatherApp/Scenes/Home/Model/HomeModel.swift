//
//  HomeModel.swift
//  SGWeatherApp
//
//  Created by Ravindran on 02/03/22.
//

import Foundation

// MARK: - WeatherInfo
struct WeatherInfo: Codable {
    let location: Location?
    let forecast: Forecast?
}

// MARK: - Location
struct Location: Codable {
    let name, country, localtime: String?
    
    enum CodingKeys: String, CodingKey {
        case name, localtime, country
    }
}

// MARK: - Forecast
struct Forecast: Codable {
    let forecastday: [Forecastday]?
}

// MARK: - Forecastday
struct Forecastday: Codable {
    let date: String?
    let day: Day?
    
    enum CodingKeys: String, CodingKey {
        case date
        case day
    }
}

// MARK: - Day
struct Day: Codable {
    let maxtempC, mintempC: Double?
    let condition: Condition?
    
    enum CodingKeys: String, CodingKey {
        case maxtempC = "maxtemp_c"
        case mintempC = "mintemp_c"
        case condition
    }
}

// MARK: - Condition
struct Condition: Codable {
    let text: String?
    let icon: String?
}

struct ForecastData: Codable {
    let date: String?
    let maxtempC, mintempC: Double?
    let icon: String?
    let text: String?
}
