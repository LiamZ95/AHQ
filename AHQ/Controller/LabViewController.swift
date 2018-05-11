//
//  LabViewController.swift
//  AHQ
//
//  Created by LIYU ZHANG on 10/5/18.
//  Copyright © 2018 liyuzhang. All rights reserved.
//

import UIKit

class LabViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        
    }
    
    // initialize navigation bar
    func setupNavigationBar() {
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.title = "3D LAB"
        // change navigation bar color
        var colors = [UIColor]()
        colors.append(UIColor(red: 201/255, green: 49/255, blue: 74/255, alpha: 1))
        colors.append(UIColor(red: 142/255, green: 38/255, blue: 111/255, alpha: 1))
        self.navigationController?.navigationBar.setGradientBackground(colors: colors)
    }


}
