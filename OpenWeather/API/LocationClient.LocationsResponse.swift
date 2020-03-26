//
//  LocationClient.LocationsResponse.swift
//  OpenWeather
//
//  Created by Jay Salvador on 27/3/20.
//  Copyright © 2020 Jay Salvador. All rights reserved.
//

import Foundation

extension LocationClient {
    
    public struct LocationsResponse: Decodable {
        
        public var count: Double?
        public var locations: [Location]?
        
        enum CodingKeys: String, CodingKey {
            
            case count
            case locations = "list"
        }
    }
}
