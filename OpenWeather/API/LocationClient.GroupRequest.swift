//
//  LocationClient.GroupRequest.swift
//  OpenWeather
//
//  Created by Jay Salvador on 27/3/20.
//  Copyright © 2020 Jay Salvador. All rights reserved.
//

import Foundation

extension LocationClient {
    
    public struct GroupRequest {
        
        public var ids: [String]?
        public var appId: String?
        public var units: String?
        
        enum CodingKeys: String, CodingKey {
            
            case ids = "id"
            case appId = "appid"
            case units
        }
    }
}

extension LocationClient.GroupRequest {
    
    var parameters: String {
        
        return UrlParameters()
            .with(key: CodingKeys.ids, value: self.ids?.joined(separator: ","))
            .with(key: CodingKeys.appId, value: self.appId)
            .with(key: CodingKeys.units, value: self.units)
            .flattened
    }
}
