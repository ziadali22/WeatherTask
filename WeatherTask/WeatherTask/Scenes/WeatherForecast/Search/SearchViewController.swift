//  
//  SearchViewController.swift
//  WeatherTask
//
//  Created by ziad on 24/03/2023.
//

import UIKit
import UIWeather

class SearchViewController: UIViewController {
    
    // MARK: Outlets

    @IBOutlet private(set) weak var searchOptionsCollectionView: UICollectionView!
    
    @IBOutlet private(set) weak var cityNameTextField: UITextField!
    @IBOutlet private(set) weak var zipCodeTextField: UITextField!
    @IBOutlet private(set) weak var latitudeStackView: UIStackView!
    @IBOutlet private(set) weak var latitudeTextField: UITextField!
    @IBOutlet private(set) weak var longitudeTextField: UITextField!
    // MARK: Properties
        
    private let viewModel: SearchViewModelType
    private let searchOptions = ["City Name", "Latitude/Longitude" , "Zip Code", "Current Location"]
    // MARK: Init
        
    init(viewModel: SearchViewModelType) {
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
        hideAllTextField()
    }
    

}

// MARK: - Actions
//
extension SearchViewController {
    
}

// MARK: - Configurations
//
extension SearchViewController {
    
    private func setupSearchOptionsCollectionView() {
        searchOptionsCollectionView.delegate = self
        searchOptionsCollectionView.dataSource = self
        searchOptionsCollectionView.register(cell: SearchOptionCVC.self)
    }
    
    private func hideAllTextField() {
        cityNameTextField.isHidden = true
        zipCodeTextField.isHidden = true
        latitudeStackView.isHidden = true
    }
}

// MARK: - CollectionView
//
extension SearchViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource  {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchOptions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SearchOptionCVC = collectionView.dequeueCell(for: indexPath)
        cell.optionName.text = searchOptions[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let wordWith = searchOptions[indexPath.row].calculateWidthForString().width + 16
        return CGSize(width: wordWith, height: 45)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        switch indexPath.row {
        case 0:
            self.zipCodeTextField.isHidden = true
            self.cityNameTextField.isHidden = false
            self.latitudeStackView.isHidden = true
        case 1:
            self.cityNameTextField.isHidden = true
            self.latitudeStackView.isHidden = false
            self.zipCodeTextField.isHidden = true
        case 2:
            self.cityNameTextField.isHidden = true
            self.latitudeStackView.isHidden = true
            self.zipCodeTextField.isHidden = false
        case 3:
            self.cityNameTextField.isHidden = true
            self.latitudeStackView.isHidden = true
            self.zipCodeTextField.isHidden = true
            
        default :
            break
        }
    }
}
