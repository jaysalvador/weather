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
    public var feels: Double?
    public var temp_min: Double?
    public var temp_max: Double?
    public var pressure: Double?
    public var humidity: Double?
}
