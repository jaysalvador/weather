//
//  UIView.swift
//  Weather
//
//  Created by Jay Salvador on 27/3/20.
//  Copyright © 2020 Jay Salvador. All rights reserved.
//

import UIKit

extension UIView {
    
    // MARK: Inspectables
    
    @IBInspectable
    public var cornerRadius: Float {
        
        set {
            
            self.layer.cornerRadius = CGFloat(newValue)
        }
        get {
            
            return Float(self.layer.cornerRadius)
        }
    }
    
    @IBInspectable
    public var borderWidth: Float {
        
        set {
            
            self.layer.borderWidth = CGFloat(newValue)
        }
        get {
            
            return Float(self.layer.borderWidth)
        }
    }
    
    @IBInspectable
    public var borderColor: UIColor? {
        
        set {
            
            self.layer.borderColor = newValue?.cgColor
        }
        get {
            
            if let cgColor = self.layer.borderColor {
                
                return UIColor(cgColor: cgColor)
            }
            
            return nil
        }
    }
    
    @IBInspectable
    public var shadowColor: UIColor? {
        
        set {
            
            self.layer.shadowColor = newValue?.cgColor
        }
        get {
            
            if let cgColor = self.layer.shadowColor {
                
                return UIColor(cgColor: cgColor)
            }
            
            return nil
        }
    }
    
    @IBInspectable
    public var shadowRadius: Float {
        
        set {
            
            self.layer.shadowRadius = CGFloat(newValue)
        }
        get {
            
            return Float(self.layer.shadowRadius)
        }
    }
    
    @IBInspectable
    public var shadowOffset: CGSize {
        
        set {
            
            self.layer.shadowOffset = newValue
        }
        get {
            
            return self.layer.shadowOffset
        }
    }
    
    @IBInspectable
    public var shadowOpacity: Float {
        
        set {
            
            self.layer.shadowOpacity = newValue
        }
        get {
            
            return self.layer.shadowOpacity
        }
    }
}
