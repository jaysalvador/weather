//
//  WeatherDetailViewController.swift
//  Weather
//
//  Created by Jay Salvador on 27/3/20.
//  Copyright © 2020 Jay Salvador. All rights reserved.
//

import UIKit
import OpenWeather
import Hero

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
    
    @IBOutlet
    private var detailStackView: UIStackView?
    
    @IBOutlet
    private var lineView: UIView?
    
    @IBOutlet
    private var backButton: UIButton?
    
    @IBOutlet
    private var transparentView: UIView?
    
    var viewModel: WeatherDetailViewModelProtocol?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        self.setup()
    }

    func setup() {
        
        guard let location = self.viewModel?.location, let id = location.id else {
            
            self.navigationController?.popViewController(animated: true)
            
            return
        }
        
        if let icon = location.weather?.first?.icon {

            self.imageView?.image = UIImage(named: icon)
            
            self.imageView?.heroID = "\(id)_imageView"
        }
        
        self.locationLabel?.text = location.fullName
        
        self.locationLabel?.heroID = "\(id)_locationLabel"
        
        self.locationLabel?.hero.modifiers = [.spring(stiffness: 250, damping: 25), .translate(x: 200, y: 100)]
        
        self.tempLabel?.text = location.temperature?.temp?.toDegrees
        
        self.tempLabel?.heroID = "\(id)_tempLabel"
        
        self.tempLabel?.hero.modifiers = [.spring(stiffness: 250, damping: 25)]

        self.weatherLabel?.text = location.weather?.first?.main
        
        self.feelsLikeLabel?.text = location.temperature?.feelsLike?.toDegrees
        
        self.minMaxLabel?.text = location.temperature?.minMaxDescription
        
        self.pressureLabel?.text = location.temperature?.pressureDescription
        
        self.humidityLabel?.text = location.temperature?.humidityDescription
        
        self.sunriseLabel?.text = location.country?.sunrise?.toString(using: .hourMin, in: location.country?.timezone)
        
        self.sunsetLabel?.text = location.country?.sunset?.toString(using: .hourMin, in: location.country?.timezone)
        
        self.detailStackView?.alpha = 0.0
        
        self.backButton?.alpha = 0.0
        
        self.lineView?.alpha = 0.0
        
        self.weatherLabel?.alpha = 0.0
        
        self.transparentView?.alpha = 0.0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
        self.animateViews(1.0)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        
        self.animateViews(0.0)
    }
    
    private func animateViews(_ alpha: CGFloat) {
        
        UIView.animate(withDuration: 0.175) {

            self.detailStackView?.alpha = alpha
            
            self.backButton?.alpha = alpha
            
            self.lineView?.alpha = alpha
            
            self.weatherLabel?.alpha = alpha
            
            self.transparentView?.alpha = alpha
        }
    }
    
    @IBAction func backButtonTouchUpInside(_ sender: UIButton) {
        
        //self.navigationController?.popViewController(animated: true)
        
        self.dismiss(animated: true, completion: nil)
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
