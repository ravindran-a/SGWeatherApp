//
//  InformationTableViewCell.swift
//  SGWeatherApp
//
//  Created by Ravindran on 02/03/22.
//

import UIKit

class InformationTableViewCell: UITableViewCell {

    static let cellIdentifier = "InformationTableViewCell"
    
    var country: UILabel!
    var city: UILabel!
    var dateTime: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        accessibilityIdentifier = InformationTableViewCell.cellIdentifier
        selectionStyle = .none
        
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
        
        country = UIFactory.getLabel(id: "countryLabel")
        city = UIFactory.getLabel(id: "cityLabel")
        dateTime = UIFactory.getLabel(id: "dateTimeLabel")
        
        contentView.addSubview(country)
        contentView.addSubview(city)
        contentView.addSubview(dateTime)
        
        contentView.layer.cornerRadius = 6.0
        contentView.layer.masksToBounds = true
    }
    
    func configureLayoutConstraints() {
        city.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16.0).isActive = true
        city.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16.0).isActive = true
        country.topAnchor.constraint(equalTo: city.bottomAnchor, constant: 8.0).isActive = true
        dateTime.topAnchor.constraint(equalTo: country.bottomAnchor, constant: 8.0).isActive = true
        dateTime.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16.0).isActive = true
        country.leadingAnchor.constraint(equalTo: city.leadingAnchor).isActive = true
        dateTime.leadingAnchor.constraint(equalTo: city.leadingAnchor).isActive = true
    }
    
}
