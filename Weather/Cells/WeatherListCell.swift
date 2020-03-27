//
//  WeatherListCell.swift
//  Weather
//
//  Created by Jay Salvador on 27/3/20.
//  Copyright © 2020 Jay Salvador. All rights reserved.
//

import UIKit
import OpenWeather

class WeatherListCell: UICollectionViewCell {

    @IBOutlet private var label: UILabel?
    @IBOutlet private var tempLabel: UILabel?
    @IBOutlet private var bgImageView: UIImageView?
    
    func prepare(location: Location) -> UICollectionViewCell? {
     
        guard let temp = location.temperature?.temp, let image = location.currentWeather?.icon else {
            
            return nil
        }
        
        let tempLabel = "\(Int(temp))°"
        
        let label = "\(location.name ?? ""), \(location.country?.country ?? "")"
        
        return self.prepare(label: label, tempLabel: tempLabel, image: UIImage(named: image))
    }
    
    func prepare(label: String?, tempLabel: String?, image: UIImage?) -> UICollectionViewCell? {
        
        self.label?.text = label
        
        self.tempLabel?.text = tempLabel
        
        self.bgImageView?.image = image
        
        return self
    }
}
