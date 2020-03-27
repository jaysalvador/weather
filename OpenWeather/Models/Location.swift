//
//  Location.swift
//  OpenWeather
//
//  Created by Jay Salvador on 27/3/20.
//  Copyright © 2020 Jay Salvador. All rights reserved.
//

import Foundation

public struct Location: Codable {
    
    public var id: Int?
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

extension Location: Equatable {
    
    // add equatable to compare Location objects
    
    public static func == (lhs: Location, rhs: Location) -> Bool {
        
        guard let lhsId = lhs.id, let rhsId = rhs.id else {
            
            return false
        }
        
        return lhsId == rhsId
    }
}

extension Location {
    
    public var currentWeather: Weather? {
        
        return self.weather?.first
    }
}
