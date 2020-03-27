//
//  Date.swift
//  OpenWeather
//
//  Created by Jay Salvador on 26/3/20.
//  Copyright © 2020 Jay Salvador. All rights reserved.
//

import Foundation

extension Date {
    
    /// Uses a `DateFormatter` to return the `String` formatted `Date` value
    /// - Parameter dateFormatter: user-defined `DateFormatter`
    /// - Parameter timezone: custom `TimeZone`
    public func toString(using dateFormatter: DateFormatter?, in timezone: Int? = nil) -> String? {

        dateFormatter?.timeZone = TimeZone(secondsFromGMT: timezone ?? 0)

        return dateFormatter?.string(from: self)
    }
}
