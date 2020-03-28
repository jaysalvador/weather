//
//  WeatherListCell.swift
//  Weather
//
//  Created by Jay Salvador on 27/3/20.
//  Copyright © 2020 Jay Salvador. All rights reserved.
//

import UIKit
import OpenWeather
import Hero

class WeatherListCell: UICollectionViewCell {

    @IBOutlet private var label: UILabel?
    @IBOutlet private var tempLabel: UILabel?
    @IBOutlet private var bgImageView: UIImageView?
    
    func prepare(location: Location) -> UICollectionViewCell? {
     
        guard let id = location.id,
            let temp = location.temperature?.temp?.toDegrees,
            let image = location.currentWeather?.icon else {
            
            return nil
        }
                
        return self.prepare(id: String(id), label: location.fullName, tempLabel: temp, image: UIImage(named: image))
    }
    
    func prepare(id: String, label: String?, tempLabel: String?, image: UIImage?) -> UICollectionViewCell? {
        
        self.accessibilityIdentifier = label
        
        self.label?.text = label
        
        self.label?.heroID = "\(id)_locationLabel"
        
        self.label?.hero.modifiers = [.spring(stiffness: 250, damping: 25)]
        
        self.tempLabel?.text = tempLabel
        
        self.tempLabel?.heroID = "\(id)_tempLabel"
        
        self.bgImageView?.image = image
        
        self.bgImageView?.heroID = "\(id)_imageView"
        
        return self
    }
}
