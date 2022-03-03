//
//  HomeViewModel.swift
//  SGWeatherApp
//
//  Created by Ravindran on 01/03/22.
//

import Foundation
import UIKit

class HomeViewModel {
    
    var weatherInformation: WeatherInfo?
    
    func getCityWeatherInfo(shouldRefreshData: Bool, cityName: String, numberOfDays: Int, airQualityInformation: String, alerts: String,
                            completionHandler: ((Error?) -> Void)? = nil) {
        if let cachedWeatherInfoData = UserDefaultsManager.objectForKey(.weatherInfo) as? Data,
           let cachedWeatherInfo = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(cachedWeatherInfoData) as? WeatherInfo, !shouldRefreshData {
            self.weatherInformation = cachedWeatherInfo
            completionHandler?(nil)
        } else {
            let endPoint = APIEndPoints.WeatherInfo.getCityWeatherInformation(key: APIEndPoints.API_KEY, cityName: cityName, numberOfDays: numberOfDays,
                                                                              airQualityInformation: airQualityInformation, alerts: alerts).url
            ApiManager.shared.dataTask(serviceURL: endPoint) { data, error in
                guard let responseData = data, error == nil else {
                    completionHandler?(error)
                    return
                }
                do {
                    let responseModel = try JSONDecoder().decode(WeatherInfo.self, from: responseData)
                    self.weatherInformation = responseModel
                    let encodedData = try? NSKeyedArchiver.archivedData(withRootObject: responseModel, requiringSecureCoding: false)
                    UserDefaultsManager.setObject(encodedData, forKey: .weatherInfo)
                    completionHandler?(nil)
                } catch let error {
                    completionHandler?(error)
                }
            }
        }
    }
        
    func getLocationInformation() -> (country: String?, city: String?, dateTime: String?)? {
        var dateString: String?
        let dateFormatter = DateFormatter()
        if let date = dateFormatter.getDateFromMultipleFormats(fromString: weatherInformation?.location?.localtime) {
            dateFormatter.dateFormat = "dd-MMM-yyyy hh:mm a"
            dateString = dateFormatter.string(from: date)
        }
        return (weatherInformation?.location?.country, weatherInformation?.location?.name, dateString)
    }
        
    func getForecastData() -> [ForecastData]? {
        var forecastData: [ForecastData] = []
        var dateString: String?
        let dateFormatter = DateFormatter()
        for data in weatherInformation?.forecast?.forecastday ?? [] {
            let icon = "https:" + (data.day?.condition?.icon ?? "")
            if let date = dateFormatter.getDateFromMultipleFormats(fromString: data.date) {
                dateFormatter.dateFormat = "dd MMM, yyyy"
                dateString = dateFormatter.string(from: date)
            }
            forecastData.append(ForecastData(date: dateString, maxtempC: data.day?.maxtempC, mintempC: data.day?.mintempC,
                                             icon: icon, text: data.day?.condition?.text))
        }
        return forecastData
    }

}
