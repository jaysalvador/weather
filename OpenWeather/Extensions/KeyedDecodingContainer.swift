//
//  KeyedDecodingContainer.swift
//  OpenWeather
//
//  Created by Jay Salvador on 26/3/20.
//  Copyright © 2020 Jay Salvador. All rights reserved.
//

import Foundation

/// extending `KeyedDecodingContainer` to handle decoding for dates and rate values

extension KeyedDecodingContainer {
    
    /// Decode dates aligned to formats thrown by the API
    /// - Parameter key: the `CodingKey` attribute name
    func dateIfPresent(forKey key: KeyedDecodingContainer.Key) -> Date? {
        
        guard let timestamp = try? self.decodeIfPresent(Double.self, forKey: key) else {
            
            return nil
        }
        
        return Date(timeIntervalSince1970: timestamp)
    }
    
    /// Decode numbers based on the formats thrown by the API
    /// returns `nil` if the value is not a number e.g. "N/A"
    /// - Parameter key: the `CodingKey` attribute name
    func doubleIfPresent(forKey key: KeyedDecodingContainer.Key) -> Double? {
        
        guard let string = try? self.decodeIfPresent(String.self, forKey: key) else {
            
            return nil
        }
        
        return Double(string)
    }
}
