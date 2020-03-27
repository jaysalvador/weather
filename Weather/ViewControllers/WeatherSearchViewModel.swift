//
//  WeatherSearchViewModel.swift
//  Weather
//
//  Created by Jay Salvador on 27/3/20.
//  Copyright © 2020 Jay Salvador. All rights reserved.
//

import Foundation
import OpenWeather

protocol WeatherSearchViewModelProtocol {
    
    // MARK: - Data
    
    var selectedLocations: [Location]? { get }
    
    var locations: [Location]? { get }
    
    var query: String? { get set }
    
    // MARK: - Callbacks
    
    var onUpdated: ViewModelCallback? { get set }
    
    var onError: ViewModelCallback? { get set }
    
}

class WeatherSearchViewModel: WeatherSearchViewModelProtocol {
    
    // MARK: - Dependencies
    
    private var locationClient: LocationClientProtocol?
    
    // MARK: - Data
    
    private(set) var locations: [Location]?
    
    private(set) var selectedLocations: [Location]?
    
    var query: String? {
        
        didSet {
            
            DispatchQueue.main.async { [weak self] in
                
                self?.search()
            }
        }
    }
    
    // MARK: - Callbacks
    
    var onUpdated: ViewModelCallback?
    
    var onError: ViewModelCallback?
    
    // MARK: - Init
    
    convenience init(locations: [Location]?) {
        
        self.init(locations: locations, locationClient: LocationClient())
    }
    
    init(locations _locations: [Location]?, locationClient _locationClient: LocationClientProtocol?) {
        
        self.selectedLocations = _locations
        
        self.locationClient = _locationClient
    }
    
    // MARK: - Functions
    
    private func search() {
        
        self.locationClient?.findLocation(query: self.query) { [weak self] (response) in
               
            switch response {

            case .success(let result):

                self?.locations = result.locations?.filter { self?.selectedLocations?.contains($0) == false }
                           
                self?.onUpdated?()

            case .failure:

                self?.locations = nil
                
                self?.onError?()
            }
       }
    }
}
