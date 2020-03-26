//
//  Weather.swift
//  OpenWeather
//
//  Created by Jay Salvador on 27/3/20.
//  Copyright © 2020 Jay Salvador. All rights reserved.
//

import Foundation

public struct Weather: Codable {
    
    public var id: Double?
    public var main: String?
    public var description: String?
    public var icon: String?
}
