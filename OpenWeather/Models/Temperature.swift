//
//  Temperature.swift
//  OpenWeather
//
//  Created by Jay Salvador on 27/3/20.
//  Copyright © 2020 Jay Salvador. All rights reserved.
//

import Foundation

public struct Temperature: Codable {
    
    public var temp: Float?
    public var feelsLike: Float?
    public var tempMin: Float?
    public var tempMax: Float?
    public var pressure: Float?
    public var humidity: Float?
    
    enum CodingKeys: String, CodingKey {
        
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case humidity
    }
}

extension Temperature: Equatable {
    
    // add equatable to compare Location objects
    
    public static func == (lhs: Temperature, rhs: Temperature) -> Bool {
        
        return
            lhs.temp == rhs.temp &&
            lhs.feelsLike == rhs.feelsLike &&
            lhs.tempMin == rhs.tempMin &&
            lhs.tempMax == rhs.tempMax &&
            lhs.pressure == rhs.pressure &&
            lhs.humidity == rhs.humidity
    }
}

extension Temperature {
    
    public var minMaxDescription: String {
        
        return "\(self.tempMin?.toDegrees ?? "")/\(self.tempMax?.toDegrees ?? "")"
    }
    
    public var pressureDescription: String {
        
        return "\(Int(self.pressure ?? 0)) hPa"
    }
    
    public var humidityDescription: String {
        
        return "\(Int(self.humidity ?? 0))%"
    }
}
