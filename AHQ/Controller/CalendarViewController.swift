//
//  CalendarViewController.swift
//  AHQ
//
//  Created by LIYU ZHANG on 17/4/18.
//  Copyright © 2018 liyuzhang. All rights reserved.
//

import UIKit
import GoogleSignIn

class CalendarViewController: UIViewController, GIDSignInUIDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance().clientID = "730337957622-b2hfk5no3qqt6g59idtskksmj1blckd9.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().uiDelegate = self
        
        let signInButton = GIDSignInButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        signInButton.center = view.center
        
        view.addSubview(signInButton)
        
    }
    
}
