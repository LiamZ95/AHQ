//
//  FirstViewController.swift
//  AHQ
//
//  Created by LIYU ZHANG on 13/4/18.
//  Copyright © 2018 liyuzhang. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var pageMenu : CAPSPageMenu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPages()
        setupNavigationBar()
        
    }
    
    // initialize navigation bar
    func setupNavigationBar() {
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.title = "HOME"
        // change navigation bar color
        var colors = [UIColor]()
        colors.append(UIColor(red: 201/255, green: 49/255, blue: 74/255, alpha: 1))
        colors.append(UIColor(red: 142/255, green: 38/255, blue: 111/255, alpha: 1))
        self.navigationController?.navigationBar.setGradientBackground(colors: colors)
    }
    
    
    // initialize page menu
    func setupPages() {
        var controllerArray: [UIViewController] = []
        
        let navheight = (navigationController?.navigationBar.frame.size.height ?? 0) + UIApplication.shared.statusBarFrame.size.height

        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        let vc1 = storyBoard.instantiateViewController(withIdentifier: "FeedViewController") as! UICollectionViewController
        let vc2 = storyBoard.instantiateViewController(withIdentifier: "MessageViewController")
        
        vc1.title = "Feed"
        vc2.title = "Message"
        
        controllerArray.append(vc1)
        controllerArray.append(vc2)
        
        let parameters: [CAPSPageMenuOption] = [
            .menuItemSeparatorWidth(4.3),
            .useMenuLikeSegmentedControl(true),
            .menuItemSeparatorPercentageHeight(0.1),
            .menuHeight(50),
            .scrollMenuBackgroundColor (UIColor(red: 142/255, green: 38/255, blue: 111/255, alpha: 1)),
            .menuItemFont(UIFont.boldSystemFont(ofSize: 20))
            ]
        
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0.0, y: navheight, width: self.view.frame.width, height: self.view.frame.height-49.0), pageMenuOptions: parameters)
        
        self.view.addSubview(pageMenu!.view)
        
    }
    
    

}

