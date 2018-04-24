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
    
    var funcs = ["Workouts", "Functional movement", "Athletic testing", "Self reporting"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        funcCollectionView.dataSource = self
        funcCollectionView.delegate = self
        
        adjustCellPosition()
    }
    
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
