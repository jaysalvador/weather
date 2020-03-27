//
//  WeatherListViewModel.swift
//  Weather
//
//  Created by Jay Salvador on 27/3/20.
//  Copyright © 2020 Jay Salvador. All rights reserved.
//

import Foundation
import OpenWeather

protocol WeatherListViewModelProtocol {
    
    // MARK: - Data
    
    var locations: [Location]? { get set }
    
    // MARK: - Callbacks
    
    var onUpdated: ViewModelCallback? { get set }
    
    var onError: ViewModelCallback? { get set }
    
    var onLoop: ViewModelCallback? { get set }
    
    // MARK: - Functions
    
    func loadLocations()
    
    func reloadLocations(_ loop: Bool)
    
    func reloadLocations(ids: [String]?, loop: Bool)
}

class WeatherListViewModel: WeatherListViewModelProtocol {
    
    // MARK: - Dependencies
    
    private var locationClient: LocationClientProtocol?
    
    // MARK: - Data
    
    var locations: [Location]?
    
    // MARK: - Callbacks
    
    var onUpdated: ViewModelCallback?
    
    var onError: ViewModelCallback?
    
    var onLoop: ViewModelCallback?
    
    // MARK: - Init
    
    convenience init() {
        
        self.init(locationClient: LocationClient())
    }
    
    init(locationClient _locationClient: LocationClientProtocol?) {
        
        self.locationClient = _locationClient
    }
    
    // MARK: - Functions
    
    func loadLocations() {
        
        self.reloadLocations(ids: ["2147714","2158177","2174003"], loop: true)
    }
    
    func reloadLocations(_ loop: Bool = false) {
        
        self.reloadLocations(ids: locations?.compactMap { String($0.id ?? 0) }, loop: true)
    }
    
    func reloadLocations(ids: [String]?, loop: Bool = false) {
        
        self.getLocations(ids: ids, loop: loop)
    }
    
    private func getLocations(ids: [String]?, loop: Bool = false) {
        
        self.locationClient?.getLocations(ids: ids) { [weak self] (response) in
        
            switch response {

            case .success(let result):

                self?.locations = result.locations
                                
                self?.onUpdated?()

            case .failure:

                self?.onError?()
            }
            
            if loop == true {
                
                self?.onLoop?()
            }
        }
    }
}
