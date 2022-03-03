//
//  String+Extension.swift
//  SGWeatherApp
//
//  Created by Ravindran on 02/03/22.
//

import Foundation

extension String {
    var urlEncoded: String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
    }
}
