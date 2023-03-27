//  
//  WeatherForecastViewController.swift
//  WeatherTask
//
//  Created by ziad on 24/03/2023.
//

import UIKit
import UIWeather

class WeatherForecastViewController: UIViewController {
    
    // MARK: Outlets

    @IBOutlet private(set) weak var searchTextField: UITextField!
    @IBOutlet private(set) weak var searchOptionsCollectionView: UICollectionView!
    @IBOutlet private(set) weak var hoursCollectionView: UICollectionView!
    @IBOutlet private(set) weak var forecastTableView: UITableView!
    
    // MARK: Properties
        
    private let viewModel: WeatherForecastViewModelType
    weak var coordinator: ForecastChildCoorindator?
    
    let optionDumbData = ["Cairo", "Tokyo"]
    // MARK: Init
        
    init(viewModel: WeatherForecastViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchOptionsCollectionView()
        setupHoursCollectionView()
        setupForecastTableView()
        
    }
    
    
}

// MARK: - Actions
//
extension WeatherForecastViewController {
    
    @IBAction func navigateToSearchOptions(_ sender: Any) {
        coordinator?.navigateToSearchOptions()
    }
}

// MARK: - Configurations
//
extension WeatherForecastViewController {
    
    
    private func setupSearchOptionsCollectionView() {
        searchOptionsCollectionView.delegate = self
        searchOptionsCollectionView.dataSource = self
        searchOptionsCollectionView.register(cell: SearchOptionsCVC.self)
    }
    
    private func setupHoursCollectionView() {
        hoursCollectionView.delegate = self
        hoursCollectionView.dataSource = self
        hoursCollectionView.register(cell: HourlyCVC.self)
    }
    
    private func setupForecastTableView() {
        forecastTableView.delegate = self
        forecastTableView.dataSource = self
        forecastTableView.register(cell: ForecastTVC.self)
    }
    
    
}

// MARK: - forecast TableView
//
extension WeatherForecastViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ForecastTVC = tableView.dequeueCell()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(60)
    }
    
}

// MARK: - CollectionView
//
extension WeatherForecastViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        switch collectionView {
        case searchOptionsCollectionView:
            return optionDumbData.count
        case hoursCollectionView:
            return 10
        default:
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case searchOptionsCollectionView:
            let cell: SearchOptionsCVC = collectionView.dequeueCell(for: indexPath)
            cell.searchOptionCityName.text = optionDumbData[indexPath.row]
            return cell
        case hoursCollectionView:
            let cell: HourlyCVC = collectionView.dequeueCell(for: indexPath)
            cell.configureCell(hour: "12 PM", tempreatureIcon: "sun.max.fill", temprature: "13 C")
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        case searchOptionsCollectionView:
            let width = optionDumbData[indexPath.row].calculateWidthForString().width + 24
            return CGSize(width: width, height: 40)
        case hoursCollectionView:
            return CGSize(width: 80, height: 110)
        default:
            return CGSize()
        }
    }
    

    
}
