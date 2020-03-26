//
//  UrlParameters.swift
//  OpenWeather
//
//  Created by Jay Salvador on 27/3/20.
//  Copyright © 2020 Jay Salvador. All rights reserved.
//

import Foundation

class UrlParameters<T: CodingKey> {
    
    private var params = Array<String>()
    
    func with(key: T, value: Any?) -> UrlParameters {
        
        if let _value = value {
            
            self.params.append("\(key.stringValue)=\(_value)")
        }
        
        return self
    }
    
    var flattened: String {
        
        if !self.params.isEmpty {
            
            return "?\(self.params.joined(separator: "&"))"
        }
        else {
            
            return ""
        }
    }
}
