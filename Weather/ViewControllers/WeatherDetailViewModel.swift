//
//  WeatherDetailViewModel.swift
//  Weather
//
//  Created by Jay Salvador on 27/3/20.
//  Copyright © 2020 Jay Salvador. All rights reserved.
//

import Foundation
import OpenWeather

protocol WeatherDetailViewModelProtocol {
    
    var location: Location? { get }
}

class WeatherDetailViewModel: WeatherDetailViewModelProtocol {
    
    private(set) var location: Location?
    
    // MARK: - Init
    
    init(location _location: Location?) {
        
        self.location = _location
    }
    
    
}
