//
//  Temperature.swift
//  OpenWeather
//
//  Created by Jay Salvador on 27/3/20.
//  Copyright © 2020 Jay Salvador. All rights reserved.
//

import Foundation

public struct Temperature: Codable {
    
    public var temp: Double?
    public var feelsLike: Double?
    public var tempMin: Double?
    public var tempMax: Double?
    public var pressure: Double?
    public var humidity: Double?
    
    enum CodingKeys: String, CodingKey {
        
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case humidity
    }
}
