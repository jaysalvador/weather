//
//  LocationClient.DetailRequest.swift
//  OpenWeather
//
//  Created by Jay Salvador on 27/3/20.
//  Copyright © 2020 Jay Salvador. All rights reserved.
//

import Foundation

extension LocationClient {

    public struct DetailRequest: Encodable {
        
        public var locationId: String?
        public var appId: String?
        
        enum CodingKeys: String, CodingKey {
            
            case locationId = "id"
            case appId = "appid"
        }
    }
}

extension LocationClient.DetailRequest {
    
    var parameters: String {
        
        return UrlParameters()
            .with(key: CodingKeys.locationId, value: self.locationId)
            .with(key: CodingKeys.appId, value: self.appId)
            .flattened
    }
}
