//
//  DispatchQueue.swift
//  OpenWeather
//
//  Created by Jay Salvador on 26/3/20.
//  Copyright © 2020 Jay Salvador. All rights reserved.
//

import Foundation

extension DispatchQueue {
    
    /// Accessible variable for the Background Queue
    public class var background: DispatchQueue {
        
        return DispatchQueue.global(qos: .background)
    }
    
    public func debounce(delay: DispatchTimeInterval, action: @escaping (() -> Void)) -> (() -> Void) {
        
        var currentWorkItem: DispatchWorkItem?
        
        return { [weak self] in
            
            currentWorkItem?.cancel()
            currentWorkItem = DispatchWorkItem { action() }
            
            self?.asyncAfter(deadline: .now() + delay, execute: currentWorkItem!)
        }
    }
    
    public func debounce<T>(delay: DispatchTimeInterval, action: @escaping ((T) -> Void)) -> (T) -> Void {
        
        var currentWorkItem: DispatchWorkItem?
        
        return { [weak self] (p1: T) in
            
            currentWorkItem?.cancel()
            currentWorkItem = DispatchWorkItem { action(p1) }
            
            self?.asyncAfter(deadline: .now() + delay, execute: currentWorkItem!)
        }
    }
}
