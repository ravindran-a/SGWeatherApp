//
//  ForecastTableViewCell.swift
//  SGWeatherApp
//
//  Created by Ravindran on 02/03/22.
//

import UIKit

class ForecastTableViewCell: UITableViewCell, UICollectionViewDelegate,
                                UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    static let cellIdentifier = "ForecastTableViewCell"
    
    var forecastCollectionView: UICollectionView!
    var dataSource = [ForecastData]()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        accessibilityIdentifier = ForecastTableViewCell.cellIdentifier
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
        contentView.backgroundColor = .clear
        forecastCollectionView = UIFactory.getCollectionView(id: "forecastCollectionView", dataSource: self, delegate: self)
        forecastCollectionView.register(ForecastCollectionViewCell.self, forCellWithReuseIdentifier: ForecastCollectionViewCell.cellIdentifier)
        forecastCollectionView.backgroundColor = .clear
        contentView.addSubview(forecastCollectionView)
    }
    
    func configureLayoutConstraints() {
        forecastCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        forecastCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        forecastCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        forecastCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        forecastCollectionView.heightAnchor.constraint(equalToConstant: 192).isActive = true
    }
    
    func configureCell(data: [ForecastData]) {
        self.dataSource = data
        self.forecastCollectionView.reloadData()
    }

}

extension ForecastTableViewCell {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ForecastCollectionViewCell.cellIdentifier, for: indexPath) as? ForecastCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let data = dataSource[indexPath.item]
        cell.date.text = data.date
        cell.minTemp.text = "↓ \(data.mintempC ?? 0) °C"
        cell.maxTemp.text = "↑ \(data.maxtempC ?? 0) °C"
        cell.weatherInfo.text = data.text
        cell.weatherImage.imageWithURL(data.icon)
        return cell
    }
    
}

extension ForecastTableViewCell {
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 160)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16.0
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16.0
    }

}
