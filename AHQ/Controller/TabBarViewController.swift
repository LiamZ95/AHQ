//
//  TabBarViewController.swift
//  AHQ
//
//  Created by LIYU ZHANG on 23/4/18.
//  Copyright © 2018 liyuzhang. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // customize color for tab bar
        
        // change active icon color
        UITabBar.appearance().tintColor = UIColor(red: 142/255, green: 38/255, blue: 111/255, alpha: 1)
    }
    
    

}
