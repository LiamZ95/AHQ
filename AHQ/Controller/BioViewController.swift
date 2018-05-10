//
//  BioViewController.swift
//  AHQ
//
//  Created by LIYU ZHANG on 17/4/18.
//  Copyright © 2018 liyuzhang. All rights reserved.
//

import UIKit

class BioViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var funcCollectionView: UICollectionView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollUIView: UIView!
    
    var funcs = ["Workouts", "Functional movement", "Athletic testing", "Self reporting"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        funcCollectionView.dataSource = self
        funcCollectionView.delegate = self
        
        // set gradient color for view in scrollview
        let backgroundLayer = CAGradientLayer().setGradientBackground()
        // set gradient from left to right
        backgroundLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        backgroundLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        backgroundLayer.frame = scrollUIView.bounds
        scrollUIView.layer.insertSublayer(backgroundLayer, at: 0)
        
        adjustCellPosition()
    }
    
    // set the layout of collection view cell
    func adjustCellPosition() {
        // Create flow layout
        let flow = UICollectionViewFlowLayout()
        
        // Define layout constants

        // adjust layout
        let cellSize = CGFloat(160)
        let itemInOneLine = CGFloat(2)
        let totalWidth = funcCollectionView!.bounds.size.width
        let space = floor((totalWidth - itemInOneLine * cellSize)/(itemInOneLine+1))
        flow.sectionInset = UIEdgeInsets(top: space, left: space, bottom: space, right: space)
        flow.itemSize = CGSize(width: cellSize, height: cellSize)
        flow.minimumInteritemSpacing = space
        flow.minimumLineSpacing = space
        
        // Apply flow layout
        funcCollectionView?.setCollectionViewLayout(flow, animated: false)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return funcs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = funcCollectionView.dequeueReusableCell(withReuseIdentifier: "profileFuncCell", for: indexPath) as! ProfileCollectionViewCell
        
        cell.funcName.text = funcs[indexPath.row]
        cell.backgroundColor = UIColor.gray
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}
