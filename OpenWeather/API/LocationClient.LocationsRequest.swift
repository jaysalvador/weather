//
//  LocationClient.LocationsRequest.swift
//  OpenWeather
//
//  Created by Jay Salvador on 27/3/20.
//  Copyright © 2020 Jay Salvador. All rights reserved.
//

import Foundation

extension LocationClient {

    public struct LocationsRequest: Encodable {
        
        public var query: String?
        public var appId: String?
        public var units: String?
        
        enum CodingKeys: String, CodingKey {
            
            case query = "q"
            case appId = "appid"
            case units
        }
    }
}

extension LocationClient.LocationsRequest {
    
    var parameters: String {
        
        return UrlParameters()
            .with(key: CodingKeys.query, value: self.query?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed))
            .with(key: CodingKeys.appId, value: self.appId)
            .with(key: CodingKeys.units, value: self.units)
            .flattened
    }
}
