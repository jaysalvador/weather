//
//  Country.swift
//  OpenWeather
//
//  Created by Jay Salvador on 27/3/20.
//  Copyright © 2020 Jay Salvador. All rights reserved.
//

import Foundation

public struct Country: Codable {
    
    public var country: String?
    public var sunrise: Date?
    public var sunset: Date?
    
    enum CodingKeys: String, CodingKey {
        
        case country
        case sunrise
        case sunset
    }

    // decoder override to handle dates and numbers
    public init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.country = try container.decodeIfPresent(String.self, forKey: .country)
        self.sunrise = container.dateIfPresent(forKey: .sunrise)
        self.sunset = container.dateIfPresent(forKey: .sunset)
    }
}
