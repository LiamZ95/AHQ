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
        //
        setupNavigationBar()
        
        // for google
        GIDSignIn.sharedInstance().uiDelegate = self
        
        // Uncomment to automatically sign in the user.
        //GIDSignIn.sharedInstance().signInSilently()
        
        let signInButton = GIDSignInButton(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        signInButton.center = view.center
        
        view.addSubview(signInButton)
        
    }
    
    // initialize navigation bar
    func setupNavigationBar() {
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.title = "CALENDAR"
        // change navigation bar color
        var colors = [UIColor]()
        colors.append(UIColor(red: 201/255, green: 49/255, blue: 74/255, alpha: 1))
        colors.append(UIColor(red: 142/255, green: 38/255, blue: 111/255, alpha: 1))
        self.navigationController?.navigationBar.setGradientBackground(colors: colors)
    }
    
}
