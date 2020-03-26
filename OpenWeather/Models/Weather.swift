//
//  Weather.swift
//  OpenWeather
//
//  Created by Jay Salvador on 27/3/20.
//  Copyright © 2020 Jay Salvador. All rights reserved.
//

import Foundation

public struct Weather: Codable {
    
    public var id: Int?
    public var main: String?
    public var description: String?
    public var icon: String?
}

extension Weather: Equatable {
    
    // add equatable to compare Location objects
    
    public static func == (lhs: Weather, rhs: Weather) -> Bool {
        
        guard let lhsId = lhs.id, let rhsId = rhs.id else {
            
            return false
        }
        
        return lhsId == rhsId && lhs.main == rhs.main && lhs.icon == rhs.icon
    }
}
