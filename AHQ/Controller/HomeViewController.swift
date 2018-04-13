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
    
    @IBOutlet weak var menuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPages()
    }
    
    func setupPages() {
        var controllerArray: [UIViewController] = []
        
        let navheight = (navigationController?.navigationBar.frame.size.height ?? 0) + UIApplication.shared.statusBarFrame.size.height

        
        let vc1 = FeedViewController()
        vc1.title = "Feed"

        let vc2 = MessageViewController()
        vc2.title = "Message"
        
        controllerArray.append(vc1)
        controllerArray.append(vc2)
        
        //        let parameters: [CAPSPageMenuOption] = [
        //            .scrollMenuBackgroundColor(UIColor.red),
        //            .viewBackgroundColor(UIColor.purple),
        //            .selectionIndicatorColor(UIColor.yellow,
        //            .BottomMenuHairlineColor(UIColor(red: 70.0/255.0, green: 70.0/255.0, blue: 80.0/255.0, alpha: 1.0)),
        //            .MenuHeight(40.0),
        //            .MenuItemWidth(100.0),
        //            .CenterMenuItems(true),
        //            .SelectedMenuItemLabelColor(UIColor.blueColor())]
        
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0.0, y: navheight, width: self.view.frame.width, height: self.view.frame.height), pageMenuOptions: nil)
        
        self.view.addSubview(pageMenu!.view)
        
    }
    
    

}

