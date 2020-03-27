//
//  WeatherListViewController.swift
//  Weather
//
//  Created by Jay Salvador on 27/3/20.
//  Copyright © 2020 Jay Salvador. All rights reserved.
//

import UIKit
import OpenWeather

typealias ViewModelCallback = (() -> Void)

enum WeatherListSection: Equatable {
    
    case section
}

enum WeatherListItem: Equatable {
    
    case item(Location)
    
    static func == (lhs: WeatherListItem, rhs: WeatherListItem) -> Bool {
        
        switch (lhs, rhs) {
                
        case (.item(let lhsLocation), .item(let rhsLocation)):
            
            return lhsLocation == rhsLocation &&
                lhsLocation.weather?.first == rhsLocation.weather?.first &&
                lhsLocation.temperature == rhsLocation.temperature
        }
    }
}

class WeatherListViewController: JCollectionViewController<WeatherListSection, WeatherListItem> {

    // MARK: - View model
    
    private var viewModel: WeatherListViewModelProtocol?
    
    private var refreshControl = UIRefreshControl()
    
    private var weatherRefreshDebounced: (() -> Void)?
    
    /// generates the items based on the data given by the `ViewModel` that will be rendered on the `CollectionView`
    override var sectionsAndItems: Array<SectionAndItems> {
        
        var items = [WeatherListItem]()
            
        self.viewModel?.locations?.forEach {
            
            items.append(.item($0))
        }
        
        return [(.section, items)]
    }
    
    // MARK: - Setup
    
    /// setup the ViewModel callbacks and their behaviours
    private func setupViewModel() {
        
        self.viewModel = WeatherListViewModel()
        
        self.viewModel?.onUpdated = { [weak self] in

            DispatchQueue.main.async {

                self?.updateSectionsAndItems()
            }
        }
        
        self.viewModel?.onLoop = { [weak self] in

            DispatchQueue.main.async {

                self?.weatherRefreshDebounced?()
            }
        }
    }
    
    /// Pull-to-refresh
    private func setupPullToRefresh() {
        
        self.refreshControl.attributedTitle = NSAttributedString(string: "")
        
        self.refreshControl.addTarget(self, action: #selector(onRefresh), for: UIControl.Event.valueChanged)
        
        self.collectionView?.refreshControl = self.refreshControl
    }
    
    /// Register cells
    override func setupCollectionView() {
        
        super.setupCollectionView()
        
        self.collectionView?.register(cell: WeatherListCell.self)
    }
    
    private func setupDebouncedMethods() {
        
        self.weatherRefreshDebounced = DispatchQueue.main.debounce(
            delay: .seconds(900),
            action: { [weak self] in
                
                self?.viewModel?.reloadLocations(true)
            }
        )
    }
    
    // MARK: - View life cycle

    /// Load the currencies using the `Currency` library from the ViewModel
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.setupViewModel()
        
        self.setupDebouncedMethods()

        self.setupPullToRefresh()
        
        self.viewModel?.loadLocations()
        
    }
    
    // MARK: - Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let vc = segue.destination as? WeatherSearchViewController {

            vc.viewModel = WeatherSearchViewModel(locations: self.viewModel?.locations)
            
            vc.onWeatherSelectedClosure = self.onWeatherSelectedClosure
        }
    }
    
    // MARK: - UICollectionViewDataSource & UICollectionViewDelegate
    
    /// Renders all the items
    override func collectionView(_ collectionView: UICollectionView, cellForSection section: WeatherListSection, item: WeatherListItem, indexPath: IndexPath) -> UICollectionViewCell? {
        
        if case .item(let location) = item,
            let cell = self.collectionView?.dequeueReusable(cell: WeatherListCell.self, for: indexPath){
            
            return cell.prepare(location: location)
        }
        
        return nil
    }
    
    /// handles currency selection to show in `CurrencyDetailViewController`
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAtSection section: WeatherListSection, item: WeatherListItem) {

    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForSection section: WeatherListSection, item: WeatherListItem, indexPath: IndexPath) -> CGSize? {
        
        return CGSize(width: collectionView.frame.width, height: 72.0)
    }
    
    // MARK: - Actions
    
    @objc
    func onRefresh() {
        
        self.viewModel?.reloadLocations(false)
        
        self.refreshControl.endRefreshing()
    }

    func onWeatherSelectedClosure(location: Location) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .microseconds(175)) { [weak self] in
            
            self?.viewModel?.locations?.insert(location, at: 0)
            
            self?.viewModel?.reloadLocations(false)
        }
    }
}
