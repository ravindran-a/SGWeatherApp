//
//  DateFormatter+Extension.swift
//  SGWeatherApp
//
//  Created by Ravindran on 03/03/22.
//

import Foundation

extension DateFormatter {
    func getDateFromMultipleFormats(fromString dateString: String?) -> Date? {
        guard let confirmedDateString = dateString else {
            return nil
        }
        let formats: [String] = [
            "yyyy-MM-dd HH:mm",
            "yyyy-MM-dd"
        ]
        for format in formats {
            self.dateFormat = format
            if let date = self.date(from: confirmedDateString) {
                return date
            }
        }
        return nil
    }
}
