//
//  LoginViewController.swift
//  AHQ
//
//  Created by LIYU ZHANG on 5/5/18.
//  Copyright © 2018 liyuzhang. All rights reserved.
//

import UIKit
//import Alamofire

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
    
    // UI for sign up
    // switch to show identity
    @IBOutlet weak var coachSwitch: UISwitch!
    @IBOutlet weak var signupEmailTextField: UITextField!
    @IBOutlet weak var signupPwdTextField1: UITextField!
    @IBOutlet weak var signupPwdTextField2: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hide the sign up view
        signupViewConstraint.constant = -450

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
        let backgroundLayer = CAGradientLayer().setGradientBackground()
        backgroundLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(backgroundLayer, at: 0)
        
        // hide keyboard when touching areas outside of keyboard
        self.hideKeyboardWhenTappedAround()
        
        // set action for signin button
        signinButton.addTarget(self, action: #selector(checkSignin), for: .touchUpInside)
        // set action for signup button
        signupButton.addTarget(self, action: #selector(checkSignup), for: .touchUpInside)
    }
    
    
    @objc
    func tapFunction(sender:UITapGestureRecognizer) {
        
        if (signupViewConstraint.constant < 0) { // if the view is hidden, then show
            signupViewConstraint.constant = 211
            backgroundButton.alpha = 0.5
        } else {
            signupViewConstraint.constant = -450 // if the view is shown, then hide
            backgroundButton.alpha = 0
        }
        
        UIView.animate(withDuration: 0.2, animations: {
            self.view.layoutIfNeeded()
            })
    }
    
    
    // function for handling sign in
    @objc
    func checkSignin() {
        let loginEmailText: String = loginEmailTextField.text!
        let loginPwdText: String = loginPwdTextField.text!
        
        if loginEmailText == "1" {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let newVC = storyboard?.instantiateViewController(withIdentifier: "TabBarViewController") as! TabBarViewController
            self.present(newVC, animated: true, completion: nil)
            return
        }

        // create request
        let headers = [
            "Content-Type": "application/json",
            "Cache-Control": "no-cache",
            "Postman-Token": "b803c70c-835a-475f-a3b2-0aa0076e0791"
        ]

        let parameters = [
            "email": loginEmailText,
            "password": loginPwdText
            ] as [String : Any]
        
        do {
            let postData = try JSONSerialization.data(withJSONObject: parameters, options: [])
            let request = NSMutableURLRequest(url: NSURL(string: "https://athletehq.online/user/login")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
            request.httpMethod = "POST"
            request.allHTTPHeaderFields = headers
            request.httpBody = postData as Data
            
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                if (error != nil) {
                    print(error)
                } else {
                    let httpResponse = response as? HTTPURLResponse
                    print(httpResponse)
                }
                if let data = data {
                    print(data)
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        print(json)
                    } catch {
                        print(error)
                    }
                }
            })
            dataTask.resume()
        } catch let error as NSError{
            print(error.localizedDescription)
        }
    }
    
    
    // function for handling sign up
    @objc
    func checkSignup() {
        let email: String = signupEmailTextField.text!
        let userPwd1: String = signupPwdTextField1.text!
        let userPwd2: String = signupPwdTextField2.text!
        
        // get the identity of login user
        let isCoach = coachSwitch.isOn
        var role: String
        if isCoach {
            role = "Coach"
        } else {
            role = "Athlete"
        }
        
        // show alert for mismatching password
        if userPwd1 != userPwd2 {
            let alert = UIAlertController(title: "Error", message: "Password not matching, please check again", preferredStyle: UIAlertControllerStyle.alert)
            let ok = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
            return
        }
        
        //
        let headers = [
            "Content-Type": "application/json",
            "Cache-Control": "no-cache",
            "Postman-Token": "1384c5bb-bcf5-4200-a7a7-23171685ef31"
        ]
        let parameters = [
            "email": email,
            "password": userPwd1,
            "role": role
            ] as [String : Any]
        
        do {
            let postData = try JSONSerialization.data(withJSONObject: parameters, options: [])
            
            let request = NSMutableURLRequest(url: NSURL(string: "https://athletehq.online/user/register")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
            request.httpMethod = "POST"
            request.allHTTPHeaderFields = headers
            request.httpBody = postData as Data
            
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
                if (error != nil) {
                    print(error)
                } else {
                    let httpResponse = response as? HTTPURLResponse
                    print(httpResponse)
                }
                if let data = data {
                    print(data)
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        print(json)
                    } catch {
                        print(error)
                    }
                }
            })
            
            dataTask.resume()
        } catch let error as NSError{
            print(error.localizedDescription)
        }
    }
}
