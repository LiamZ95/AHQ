//
//  SecondViewController.swift
//  AHQ
//
//  Created by LIYU ZHANG on 13/4/18.
//  Copyright © 2018 liyuzhang. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var profilePageMenu: CAPSPageMenu?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupPages()
    }
    
    
    func setupPages() {
        var controllerArray: [UIViewController] = []
        
        let navheight = (navigationController?.navigationBar.frame.size.height ?? 0) + UIApplication.shared.statusBarFrame.size.height
        
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc1 = storyBoard.instantiateViewController(withIdentifier: "BioViewController")
        let vc2 = storyBoard.instantiateViewController(withIdentifier: "GoalViewController")
        let vc3 = storyBoard.instantiateViewController(withIdentifier: "FocusViewController")
        
        vc1.title = "Bio"
        vc2.title = "Goals"
        vc3.title = "Foucs"
        
        controllerArray.append(vc1)
        controllerArray.append(vc2)
        controllerArray.append(vc3)
        
        let parameters: [CAPSPageMenuOption] = [
            .menuItemSeparatorWidth(4.3),
            .useMenuLikeSegmentedControl(true),
            .menuItemSeparatorPercentageHeight(0.1)
        ]
        
        profilePageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0.0, y: navheight, width: self.view.frame.width, height: self.view.frame.height), pageMenuOptions: parameters)
        
        // disable scrolling
        profilePageMenu?.controllerScrollView.isScrollEnabled = false
        
        self.view.addSubview(profilePageMenu!.view)
        
    }


}

