//
//  HomeViewController+Table.swift
//  SGWeatherApp
//
//  Created by Ravindran on 02/03/22.
//

import Foundation
import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            return getCityInformationTableCell(tableView: tableView, indexPath: indexPath)
        case 1:
            return getCityForecastTableCell(tableView: tableView, indexPath: indexPath)
        default:
            return UITableViewCell()
        }
    }
    
    func getCityInformationTableCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let informationCell = tableView.dequeueReusableCell(withIdentifier: InformationTableViewCell.cellIdentifier,
                                                                  for: indexPath) as? InformationTableViewCell else {
            return UITableViewCell()
        }
        let data = viewModel.getLocationInformation()
        informationCell.country.text = data?.country
        informationCell.city.text = data?.city
        informationCell.dateTime.text = data?.dateTime
        return informationCell
    }
    
    func getCityForecastTableCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let forecastCell = tableView.dequeueReusableCell(withIdentifier: ForecastTableViewCell.cellIdentifier,
                                                                  for: indexPath) as? ForecastTableViewCell else {
            return UITableViewCell()
        }
        forecastCell.configureCell(data: viewModel.getForecastData() ?? [])
        return forecastCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "City Information"
        } else {
            return "7-Day Forecast"
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let confirmedHeaderView = view as? UITableViewHeaderFooterView {
            if section == 0 {
                confirmedHeaderView.textLabel?.text = "City Information"
            } else {
                confirmedHeaderView.textLabel?.text = "7-Day Forecast"
            }
        }
    }
    
}
