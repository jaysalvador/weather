//
//  Location.swift
//  OpenWeather
//
//  Created by Jay Salvador on 27/3/20.
//  Copyright © 2020 Jay Salvador. All rights reserved.
//

import Foundation

public struct Location: Codable {
    
    public var id: Double?
    public var name: String?
    public var coordinates: Coordinates?
    public var temperature: Temperature?
    public var weather: [Weather]?
    public var country: Country?
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case name
        case coordinates = "coord"
        case temperature = "main"
        case weather
        case country = "sys"
    }
}
