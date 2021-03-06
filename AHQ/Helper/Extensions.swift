//
//  Extensions.swift
//  AHQ
//
//  Created by LIYU ZHANG on 22/4/18.
//  Copyright © 2018 liyuzhang. All rights reserved.
//

import Foundation
import UIKit

extension CAGradientLayer {
    convenience init(frame: CGRect, colors: [UIColor]) {
        self.init()
        self.frame = frame
        self.colors = []
        for color in colors {
            self.colors?.append(color.cgColor)
        }
        // this which adjust the orientation of gradient
        startPoint = CGPoint(x: 0, y: 0.5)
        endPoint = CGPoint(x: 1, y: 0.5)
    }
    
    func createGradientImage() -> UIImage? {
        
        var image: UIImage? = nil
        UIGraphicsBeginImageContext(bounds.size)
        if let context = UIGraphicsGetCurrentContext() {
            render(in: context)
            image = UIGraphicsGetImageFromCurrentImageContext()
        }
        UIGraphicsEndImageContext()
        return image
    }
}

extension UINavigationBar {
    
    func setGradientBackground(colors: [UIColor]) {
        
        var updatedFrame = bounds
        updatedFrame.size.height += self.frame.origin.y
        let gradientLayer = CAGradientLayer(frame: updatedFrame, colors: colors)
        
        setBackgroundImage(gradientLayer.createGradientImage(), for: UIBarMetrics.default)
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

// set gradient background for a view controller
extension CAGradientLayer {
    func setGradientBackground() -> CAGradientLayer {
        let colorStart = UIColor(red: 201/255, green: 49/255, blue: 74/255, alpha: 1)
        let colorEnd = UIColor(red: 142/255, green: 38/255, blue: 111/255, alpha: 1)
        let gradientColors: [CGColor] = [colorStart.cgColor, colorEnd.cgColor]
        let gradientLocations: [NSNumber] = [0.0, 1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        
        return gradientLayer
    }
}


