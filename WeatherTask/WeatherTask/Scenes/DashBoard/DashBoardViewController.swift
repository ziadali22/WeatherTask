//  
//  DashBoardViewController.swift
//  WeatherTask
//
//  Created by ziad on 22/03/2023.
//

import UIKit
import Networking
import UIWeather
import CoreLocation

class DashBoardViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet private(set) weak var location: UILabel!
    @IBOutlet private(set) weak var weatherTemprature: UILabel!
    @IBOutlet private(set) weak var weatherDescription: UILabel!
    
    @IBOutlet private(set) weak var weatherDate: UILabel!
    @IBOutlet private(set) weak var feelsLike: UILabel!
    @IBOutlet private(set) weak var tempratureMiniumem: UILabel!
    @IBOutlet private(set) weak var tempratureMaximum: UILabel!
    @IBOutlet private(set) weak var humidity: UILabel!
    
    
    // MARK: Properties
    
    private let viewModel: DashBoardViewModelType
    private var locationManager = CLLocationManager()
    weak var coordinator: MainCoordinator?
    
    // MARK: Init
    
    init(viewModel: DashBoardViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLocationManager()
    }
    
}

// MARK: - Configurations
//

extension DashBoardViewController {
    
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    
    private func updateViewWithData(latitude: Double, longitude: Double) {
        viewModel.getWheatherInfo(latitude: latitude, longitude: longitude) { [ weak self]  in
            
            guard let self = self else {return}
            self.location.text  = self.viewModel.locationText
            self.weatherTemprature.text = self.viewModel.tempratureText
            self.weatherDescription.text = self.viewModel.weatherDescription
            self.feelsLike.text = self.viewModel.feelsLike
            self.tempratureMaximum.text = self.viewModel.tempMax
            self.tempratureMiniumem.text = self.viewModel.tempMin
            self.humidity.text = self.viewModel.humidity
            self.weatherDate.text = self.viewModel.day
        }
        
    }
}
// MARK: - Actions
//
extension DashBoardViewController {
    
    @IBAction func navigateToForecast(_ sender: Any) {
//        let forecastViewController = WeatherForecastViewController(viewModel: WeatherForecastViewModel())
//        self.show(forecastViewController, sender: nil)
        
        coordinator?.naviagteToForecast()
    }
    
    @IBAction func navigationToCurrentWheather(_ sender: Any) {
        
    }
    
    private func showAlertToEnableGps() {
        coordinator?.showErrorAlert()
    }
}

// MARK: - Get Current Location And Weather Data
//
extension DashBoardViewController:  CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        switch status {
        case .notDetermined, .restricted, .denied:
            showAlertToEnableGps()

        case .authorizedAlways, .authorized, .authorizedWhenInUse:
            locationManager.startUpdatingLocation()

        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {return}
        updateViewWithData(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed \(error.localizedDescription)")
    }
    

}
