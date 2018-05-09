//
//  LoginViewController.swift
//  AHQ
//
//  Created by LIYU ZHANG on 5/5/18.
//  Copyright © 2018 liyuzhang. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var signUpView: UIView!
    @IBOutlet weak var signupLabel: UILabel!
    @IBOutlet weak var signupViewConstraint: NSLayoutConstraint!
    @IBOutlet weak var closeLabel: UILabel!
    @IBOutlet weak var backgroundButton: UIButton!
    
    // UI for sign in
    @IBOutlet weak var loginEmailTextField: UITextField!
    @IBOutlet weak var loginPwdTextField: UITextField!
    @IBOutlet weak var signinButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hide the sign up view
        signupViewConstraint.constant = -400

        // make label clikcable
        let signupTapped = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.tapFunction))
        signupLabel.isUserInteractionEnabled = true
        signupLabel.addGestureRecognizer(signupTapped)
        
        let closeTapped = UITapGestureRecognizer(target: self, action: #selector(LoginViewController.tapFunction))
        closeLabel.isUserInteractionEnabled = true
        closeLabel.addGestureRecognizer(closeTapped)
        
        // set action for background button
        backgroundButton.addTarget(self, action: #selector(LoginViewController.tapFunction), for: .touchUpInside)
        
        // gradient background
        setGradientBackground()
        
        // hide keyboard when touching areas outside of keyboard
        self.hideKeyboardWhenTappedAround()
    }
    
    
    @objc
    func tapFunction(sender:UITapGestureRecognizer) {
        
        if (signupViewConstraint.constant < 0) { // if the view is hidden, then show
            signupViewConstraint.constant = 211
            backgroundButton.alpha = 0.5
        } else {
            signupViewConstraint.constant = -400 // if the view is shown, then hide
            backgroundButton.alpha = 0
        }
        
        UIView.animate(withDuration: 0.2, animations: {
            self.view.layoutIfNeeded()
            })
    }
    
    func checkLogin() {
        let loginEmailText: String = loginEmailTextField.text!
        let loginPwdText: String = loginPwdTextField.text!
        
        // create request
        
    }
    
    func setGradientBackground() {
        
        let colorStart = UIColor(red: 201/255, green: 49/255, blue: 74/255, alpha: 1)
        let colorEnd = UIColor(red: 142/255, green: 38/255, blue: 111/255, alpha: 1)
        let gradientColors: [CGColor] = [colorStart.cgColor, colorEnd.cgColor]
        let gradientLocations: [NSNumber] = [0.0, 1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations
        
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
}
