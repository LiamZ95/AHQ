//
//  UnityViewController.swift
//  AHQ
//
//  Created by LIYU ZHANG on 12/5/18.
//  Copyright © 2018 liyuzhang. All rights reserved.
//

import UIKit

class UnityViewController: UIViewController {
    
    
    let rotateSwitch: UISwitch = {
        let switchFrame: CGRect = CGRect(x: 8, y: 8, width: 49, height: 31)
        let rSwitch = UISwitch(frame: switchFrame)
        return rSwitch
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.startUnity()
            
            let viewFrame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            let testView = UIView(frame: viewFrame)
            testView.backgroundColor = UIColor.cyan
            view.addSubview(testView)
            print("----------")
            print("++++++++++")
            
            NotificationCenter.default.addObserver(self, selector: #selector(handleUnityReady), name: NSNotification.Name("UnityReady"), object: nil)
            NotificationCenter.default.addObserver(self, selector: #selector(handleUnityToggleRotation(_:)), name: NSNotification.Name("UnityToggleRotation"), object: nil)
        }
        
        self.view.addSubview(rotateSwitch)
    }
    
    @objc func handleUnityReady() {
        showUnitySubView()
    }
    
    @objc func handleUnityToggleRotation(_ n: NSNotification) {
        if let isOn = n.userInfo?["isOn"] as? NSNumber {
            rotateSwitch.isOn = isOn.boolValue
        }
    }
    
    @IBAction func handleSwitchValueChanged(sender: UISwitch) {
        UnityPostMessage("NATIVE_BRIDGE", "RotateCube", sender.isOn ? "start" : "stop")
    }
    
    func showUnitySubView() {
        if let unityView = UnityGetGLView() {
            // insert subview at index 0 ensures unity view is behind current UI view
            view?.insertSubview(unityView, at: 0)
            
            unityView.translatesAutoresizingMaskIntoConstraints = false
            let views = ["view": unityView]
            let w = NSLayoutConstraint.constraints(withVisualFormat: "|-0-[view]-0-|", options: [], metrics: nil, views: views)
            let h = NSLayoutConstraint.constraints(withVisualFormat: "V:|-75-[view]-0-|", options: [], metrics: nil, views: views)
            view.addConstraints(w + h)
        }
    }

}
