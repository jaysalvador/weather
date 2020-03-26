//
//  Bool.swift
//  OpenWeather
//
//  Created by Jay Salvador on 26/3/20.
//  Copyright © 2020 Jay Salvador. All rights reserved.
//

import Foundation

extension Bool {
    
    /// returns the `Int` representation of the `Bool` value
    public var intValue: Int {
        
        return self ? 1 : 0
    }
}
