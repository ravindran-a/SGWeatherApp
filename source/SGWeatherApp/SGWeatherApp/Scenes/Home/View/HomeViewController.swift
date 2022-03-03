//
//  HomeViewController.swift
//  SGWeatherApp
//
//  Created by Ravindran on 01/03/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var viewModel: HomeViewModel = { return HomeViewModel() }()
    
    let city: String = "Chennai"
    let numberOfDaysForecast: Int = 7
    let airQualityInformation: String = "no"
    let alerts: String = "no"
    
    var weatherTableView: UITableView!
    var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWeatherInfoView()
        fetchWeatherInformation()
    }
    
    func setupWeatherInfoView() {
        view.backgroundColor = UIColor(withHexString: "#C7E5ED")
        navigationItem.title = "Weather Information"
        setupWeatherTableView()
        setupActivityIndicatorView()
    }
    
    func setupWeatherTableView() {
        weatherTableView = UIFactory.getTableView(id: "weatherTableView", style: .insetGrouped, dataSource: self, delegate: self)
        weatherTableView.backgroundColor = UIColor(withHexString: "#C7E5ED")
        
        weatherTableView.refreshControl = UIRefreshControl()
        weatherTableView.refreshControl?.addTarget(self, action: #selector(refreshWeatherInformation), for: .valueChanged)
        
        weatherTableView.register(InformationTableViewCell.self, forCellReuseIdentifier: InformationTableViewCell.cellIdentifier)
        weatherTableView.register(ForecastTableViewCell.self, forCellReuseIdentifier: ForecastTableViewCell.cellIdentifier)
        
        view.addSubview(weatherTableView)
        
        weatherTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        weatherTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        weatherTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        weatherTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    func setupActivityIndicatorView() {
        activityIndicator = UIFactory.getActivityIndicator(id: "activityIndicator", style: .large)
        view.addSubview(self.activityIndicator)
        
        self.activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func fetchWeatherInformation(shouldRefreshData: Bool = false) {
        activityIndicator.startAnimating()
        viewModel.getCityWeatherInfo(shouldRefreshData: shouldRefreshData, cityName: self.city, numberOfDays: self.numberOfDaysForecast,
                                     airQualityInformation: self.airQualityInformation, alerts: self.alerts) { [weak self] error in
            self?.activityIndicator.stopAnimating()
            if error != nil {
                self?.showAlert(title: "Error Fetching Weather Info", message: error?.localizedDescription ?? "")
            } else {
                self?.weatherTableView.reloadData()
            }
        }
    }
    
    @objc func refreshWeatherInformation() {
        weatherTableView.refreshControl?.endRefreshing()
        fetchWeatherInformation(shouldRefreshData: true)
    }
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
