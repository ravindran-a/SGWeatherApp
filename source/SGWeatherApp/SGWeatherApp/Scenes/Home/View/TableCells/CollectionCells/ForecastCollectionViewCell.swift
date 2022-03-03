//
//  ForecastCollectionViewCell.swift
//  SGWeatherApp
//
//  Created by Ravindran on 03/03/22.
//

import UIKit

class ForecastCollectionViewCell: UICollectionViewCell {
    
    static let cellIdentifier = "ForecastCollectionViewCell"
    
    var date: UILabel!
    var minTemp: UILabel!
    var maxTemp: UILabel!
    var weatherInfo: UILabel!
    var weatherImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        accessibilityIdentifier = ForecastCollectionViewCell.cellIdentifier
        
        configureSubViews()
        
        configureLayoutConstraints()
        
        setNeedsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configureSubViews() {
        backgroundColor = .clear
        contentView.backgroundColor = UIColor(withHexString: "#DAEDF3")
        
        date = UIFactory.getLabel(id: "date")
        minTemp = UIFactory.getLabel(id: "minTemp")
        maxTemp = UIFactory.getLabel(id: "maxTemp")
        weatherInfo = UIFactory.getLabel(id: "weatherInfo")
        weatherImage = UIFactory.getImageView(id: "weatherImage")
        
        contentView.addSubview(weatherImage)
        contentView.addSubview(date)
        contentView.addSubview(maxTemp)
        contentView.addSubview(minTemp)
        contentView.addSubview(weatherInfo)
        
        contentView.layer.cornerRadius = 6.0
        contentView.layer.masksToBounds = true
    }
    
    func configureLayoutConstraints() {
        weatherImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8).isActive = true
        weatherImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        weatherImage.widthAnchor.constraint(equalToConstant: 64).isActive = true
        weatherImage.heightAnchor.constraint(equalToConstant: 64).isActive = true
        date.topAnchor.constraint(equalTo: weatherImage.bottomAnchor, constant: 8).isActive = true
        date.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        minTemp.topAnchor.constraint(equalTo: date.bottomAnchor, constant: 8).isActive = true
        maxTemp.topAnchor.constraint(equalTo: date.bottomAnchor, constant: 8).isActive = true
        maxTemp.leadingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 16).isActive = true
        minTemp.trailingAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -16).isActive = true
        weatherInfo.topAnchor.constraint(equalTo: date.bottomAnchor, constant: 32).isActive = true
        weatherInfo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        //weatherInfo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8).isActive = true
    }
    
}
