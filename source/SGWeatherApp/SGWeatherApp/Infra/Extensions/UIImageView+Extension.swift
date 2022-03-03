//
//  UIImageView+Extension.swift
//  SGWeatherApp
//
//  Created by Ravindran on 03/03/22.
//

import Foundation
import UIKit

extension UIImageView {
    
    func imageWithURL(_ urlString: String?, placeholderImage: UIImage? = nil, contentMode: ContentMode = .scaleAspectFit) {
        
        let activityIndicator: UIActivityIndicatorView = UIFactory.getActivityIndicator(id: "activityIndicator")
        addSubview(activityIndicator)
        activityIndicator.startAnimating()
        activityIndicator.center = self.center
        
        guard let confirmedURLString = urlString,
              let confirmedURL = URL(string: confirmedURLString) else {
            self.image = placeholderImage
            activityIndicator.stopAnimating()
            activityIndicator.removeFromSuperview()
            return
        }

        self.contentMode = contentMode
        
        URLSession.shared.dataTask(with: confirmedURL) { data, response, error in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                  let mimeType = response?.mimeType, mimeType.hasPrefix("image"), let data = data, error == nil,
                  let image = UIImage(data: data) else {
                      DispatchQueue.main.async { [weak self] in
                          self?.image = placeholderImage
                          activityIndicator.stopAnimating()
                          activityIndicator.removeFromSuperview()
                      }
                      return
                  }
            DispatchQueue.main.async { [weak self] in
                self?.image = image
                activityIndicator.stopAnimating()
                activityIndicator.removeFromSuperview()
            }
        }.resume()
        
    }
    
}
