//
//  SecondViewController.swift
//  AHQ
//
//  Created by LIYU ZHANG on 13/4/18.
//  Copyright © 2018 liyuzhang. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    var pageMenu: CAPSPageMenu?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
//        if self.revealViewController() != nil {
//            menuButton.target = revealViewController()
//            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
//            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
//        }
    }


}
