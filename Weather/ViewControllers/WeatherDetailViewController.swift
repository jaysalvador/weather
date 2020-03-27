//
//  WeatherDetailViewController.swift
//  Weather
//
//  Created by Jay Salvador on 27/3/20.
//  Copyright © 2020 Jay Salvador. All rights reserved.
//

import UIKit
import OpenWeather

class WeatherDetailViewController: UIViewController {

    @IBOutlet
    private var locationLabel: UILabel?
    
    @IBOutlet
    private var tempLabel: UILabel?
    
    @IBOutlet
    private var weatherLabel: UILabel?
    
    @IBOutlet
    private var feelsLikeLabel: UILabel?
    
    @IBOutlet
    private var minMaxLabel: UILabel?
    
    @IBOutlet
    private var pressureLabel: UILabel?
    
    @IBOutlet
    private var humidityLabel: UILabel?
    
    @IBOutlet
    private var sunriseLabel: UILabel?
    
    @IBOutlet
    private var sunsetLabel: UILabel?
    
    @IBOutlet
    private var imageView: UIImageView?
    
    var viewModel: WeatherDetailViewModelProtocol?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.setup()
    }

    func setup() {
        
        guard let location = self.viewModel?.location else {
            
            self.navigationController?.popViewController(animated: true)
            
            return
        }
        
        if let icon = location.weather?.first?.icon {

            self.imageView?.image = UIImage(named: icon)
        }
        
        self.locationLabel?.text = location.fullName
        
        self.tempLabel?.text = location.temperature?.temp?.toDegrees
        
        self.weatherLabel?.text = location.weather?.first?.main
        
        self.feelsLikeLabel?.text = location.temperature?.feelsLike?.toDegrees
        
        self.minMaxLabel?.text = location.temperature?.minMaxDescription
        
        self.pressureLabel?.text = location.temperature?.pressureDescription
        
        self.humidityLabel?.text = location.temperature?.humidityDescription
        
        self.sunriseLabel?.text = location.country?.sunrise?.toString(using: .hourMin, in: location.country?.timezone)
        
        self.sunsetLabel?.text = location.country?.sunset?.toString(using: .hourMin, in: location.country?.timezone)
    }
    
    @IBAction func backButtonTouchUpInside(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
    }
}

extension WeatherDetailViewController {
    
    class func make(withViewModel viewModel: WeatherDetailViewModelProtocol) -> WeatherDetailViewController? {
        
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WeatherDetailViewController") as? WeatherDetailViewController {

            vc.viewModel = viewModel
            
            return vc
        }
        
        return nil
    }
}
