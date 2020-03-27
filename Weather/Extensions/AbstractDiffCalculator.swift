//
//  AbstractDiffCalculator.swift
//  Weather
//
//  Created by Jay Salvador on 27/3/20.
//  Copyright © 2020 Jay Salvador. All rights reserved.
//

import UIKit
import Dwifft

extension AbstractDiffCalculator where Section: Equatable, Value: Equatable {
    
    /// Looks for the `IndexPath` of a particular `Section` and `Item` provided
    /// - Parameter section: the current `Section` object
    /// - Parameter value: the current `Item` object
    func indexPath(forSection section: Section, value: Value) -> IndexPath? {
        
        let numberOfSections = self.numberOfSections()

        for sectionIndex in 0..<numberOfSections {

            if self.value(forSection: sectionIndex) == section {
             
                let numberOfObjects = self.numberOfObjects(inSection: sectionIndex)
                
                for itemIndex in 0..<numberOfObjects {
                    
                    let indexPath = IndexPath(item: itemIndex, section: sectionIndex)
                    
                    if self.value(atIndexPath: indexPath) == value {
                        
                        return indexPath
                    }
                }
            }
        }

        return nil
    }

}
