//
//  BioViewController.swift
//  AHQ
//
//  Created by LIYU ZHANG on 17/4/18.
//  Copyright © 2018 liyuzhang. All rights reserved.
//

import UIKit

class BioViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var funcCollectionView: UICollectionView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollUIView: UIView!
    
    var funcs = ["Workouts", "Functional movement", "Athletic testing", "Self reporting"]
    var tv1content = ["D.O.B    June 23, 1993", "Height 188cm", "Weight 90.35kg", "Body fat 10.36%", "Chest 7.2", "Abdomen  13.2", "Thigh   12.6"]
    var tv2content = ["Power clean", "Glute thrust", "Barbell bench", "Push press", "Back squat", "Deadlift", "Pullups", "Pendlay", "Swiss press", "Snatch", "Tricen dips"]
    
    var tableView1: UITableView?
    var tableView2: UITableView?
    
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
        // for collection view cells
        adjustCellPosition()
        
        // try add data table inside view in scrollview
        // 1st table view
        let tvFrame1: CGRect = CGRect(x: 8, y: 8, width: 200, height: 300)
        tableView1 = UITableView(frame: tvFrame1)
        
        tableView1!.delegate = self
        tableView1!.dataSource = self
        tableView1!.register(UITableViewCell.self, forCellReuseIdentifier: "tvCell1")
        tableView1!.backgroundColor = UIColor.cyan
        scrollUIView.addSubview(tableView1!)
        
        // 2nd table view
        let tvFrame2: CGRect = CGRect(x: 216, y: 8, width: 200, height: 300)
        tableView2 = UITableView(frame: tvFrame2)
        
        tableView2!.delegate = self
        tableView2!.dataSource = self
        tableView2!.register(UITableViewCell.self, forCellReuseIdentifier: "tvCell2")
        tableView2!.backgroundColor = UIColor.cyan
        scrollUIView.addSubview(tableView2!)
        

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableView1 {
            return tv1content.count
        } else {
            return tv2content.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tableView1 {
            let cell = tableView1!.dequeueReusableCell(withIdentifier: "tvCell1", for: indexPath)
            cell.textLabel!.text = tv1content[indexPath.row]
            return cell
        } else {
            let cell = tableView2!.dequeueReusableCell(withIdentifier: "tvCell2", for: indexPath)
            cell.textLabel!.text = tv2content[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView == tableView1 {
            return "Your numbers"
        } else {
            return "PBs"
        }
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
