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
        
    }
    
    @IBAction func navigationToCurrentWheather(_ sender: Any) {
        
    }
    
    private func showAlertToEnableGps() {
        let alert = UIAlertController(title: "Enable Gps For Weather", message: "GPS access is restricted. In order to get weather data, please enable GPS in the Settigs app under Privacy, Location Services.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Go to Settings now", style: UIAlertAction.Style.default, handler: { (alert: UIAlertAction!) in
            if let url = URL(string: "App-prefs:root=Privacy&path=LOCATION") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
                    }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: { _ in
            self.dismiss(animated: true)
        }))
        
        alert.modalPresentationStyle = .overFullScreen
        self.present(alert, animated: true)
    }
}

// MARK: - Get Current Location And Weather Data
//
extension DashBoardViewController:  CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        switch status {
        case .restricted, .denied:
            showAlertToEnableGps()
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
