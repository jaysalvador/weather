//
//  WeatherSearchViewController.swift
//  Weather
//
//  Created by Jay Salvador on 27/3/20.
//  Copyright © 2020 Jay Salvador. All rights reserved.
//

import UIKit
import OpenWeather

typealias WeatherSelectedClosure =  ((Location) -> Void)

enum WeatherSearchSection: Equatable {
    
    case section
}

enum WeatherSearchItem: Equatable {
    
    case item(Location)
}

class WeatherSearchViewController: JCollectionViewController<WeatherSearchSection, WeatherSearchItem> {
    
    @IBOutlet
    private var textField: UITextField?
    
    var viewModel: WeatherSearchViewModelProtocol?
    
    var onWeatherSelectedClosure: WeatherSelectedClosure?

    /// generates the items based on the data given by the `ViewModel` that will be rendered on the `CollectionView`
    override var sectionsAndItems: Array<SectionAndItems> {
        
        var items = [WeatherSearchItem]()
            
        self.viewModel?.locations?.forEach {
            
            items.append(.item($0))
        }
        
        return [(.section, items)]
    }
    
    // MARK: - Setup
    
    /// setup the ViewModel callbacks and their behaviours
    private func setupViewModel() {
        
        self.viewModel?.onUpdated = { [weak self] in

            DispatchQueue.main.async {

                self?.updateSectionsAndItems()
            }
        }
        
        self.viewModel?.onError = { [weak self] in

            DispatchQueue.main.async {

                self?.updateSectionsAndItems()
            }
        }
    }
    
    /// Register cells
    override func setupCollectionView() {
        
        super.setupCollectionView()
        
        self.collectionView?.register(cell: WeatherListCell.self)
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.setupViewModel()
        
        self.textField?.becomeFirstResponder()
    }
    
    // MARK: - UICollectionViewDataSource & UICollectionViewDelegate
    
    /// Renders all the items
    override func collectionView(_ collectionView: UICollectionView, cellForSection section: WeatherSearchSection, item: WeatherSearchItem, indexPath: IndexPath) -> UICollectionViewCell? {
        
        if case .item(let location) = item,
            let cell = self.collectionView?.dequeueReusable(cell: WeatherListCell.self, for: indexPath){
            
            return cell.prepare(location: location)
        }
        
        return nil
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAtSection section: WeatherSearchSection, item: WeatherSearchItem) {
        
        if case .item(let location) = item {

            self.onWeatherSelectedClosure?(location)
            
            self.dismiss()
        }
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForSection section: WeatherSearchSection, item: WeatherSearchItem, indexPath: IndexPath) -> CGSize? {
        
        return CGSize(width: collectionView.frame.width, height: 72.0)
    }
    
    // MARK: - Actions
    
    @IBAction func closeButtonTouchUpInside(_ sender: UIButton) {
        
        self.dismiss()
    }
    
    @IBAction
    private func textfieldEditingChanged(_ textField: UITextField) {
        
        self.viewModel?.query = textField.text
    }
    
    func dismiss() {
        
        self.dismiss(animated: true, completion: nil)
    }
}
