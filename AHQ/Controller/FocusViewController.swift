//
//  FocusViewController.swift
//  AHQ
//
//  Created by LIYU ZHANG on 17/4/18.
//  Copyright © 2018 liyuzhang. All rights reserved.
//

import UIKit

class FocusViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITableViewDelegate, UITableViewDataSource {

    var scrollView: UIScrollView?
    var scrollUIView: UIView?
    var searchBar: UISearchBar!
    var collectionView: UICollectionView!
    var tableView1: UITableView!
    var tableView2: UITableView!
    var tableView3: UITableView!
    var tableView4: UITableView!
    
    var funcs = ["Workouts", "Functional Movement", "Athletic Testing", "Self Reporting"]
    
    var tv1Data = ["➳ SQUAT | Load through the heels", "➳ SNATCH | Make sure you get triple extension", "➳ DEADLIFT | Maintain neutral spine", "➳ BENCH PRESS | Weight should travel in a slight reverse arc"]
    var tv2Data = ["➳ Work on improving dorsiflexion.", "➳ Use trigger ball to loosen up left upper trap.", "➳ Work on hip flexor tightness (banded stretches)."]
    var tv3Data = ["➳ Eat regular meals (fixed times).", "➳ Maintain low fat, high protein, high carb diet + lots of vegetables (like Elijah said)."]
    var tv4Data = ["➳ Don’t overstrain after heavy lifts.", "➳ Complete structured cooldown after every workout.", "➳ Make sure you eat properly after every workout."]
    var tvHeaders = ["Technique", "Mobility", "Nutrition", "Recovery"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create srcollview
        let scrollViewFrame: CGRect = CGRect(x: 0, y: 0, width: 375, height: 250)
        scrollView = UIScrollView(frame: scrollViewFrame)
        scrollView?.isScrollEnabled = true
        scrollView?.contentSize = CGSize(width: 840, height: 250)
        
        self.view.addSubview(scrollView!)
        
        // create UIView inside scrollView
        let scrollUIViewFrame: CGRect = CGRect(x: 0, y: 0, width: 840, height: 250)
        scrollUIView = UIView(frame: scrollUIViewFrame)
        scrollView!.addSubview(scrollUIView!)
        
        // set gradient color for view in scrollview
        let backgroundLayer = CAGradientLayer().setGradientBackground()
        // set gradient from left to right
        backgroundLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        backgroundLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        backgroundLayer.frame = scrollUIView!.bounds
        scrollUIView!.layer.insertSublayer(backgroundLayer, at: 0)
        
        // create 1st table view
        let tvFrame1: CGRect = CGRect(x: 8, y: 8, width: 200, height: 300)
        tableView1 = UITableView(frame: tvFrame1)
        tableView1.delegate = self
        tableView1.dataSource = self
        tableView1.register(UITableViewCell.self, forCellReuseIdentifier: "tvCell1")
        tableView1.backgroundColor = UIColor.cyan
        
        scrollUIView?.addSubview(tableView1)
        
        // 2nd
        let tvFrame2: CGRect = CGRect(x: 216, y: 8, width: 200, height: 300)
        tableView2 = UITableView(frame: tvFrame2)
        tableView2.delegate = self
        tableView2.dataSource = self
        tableView2.register(UITableViewCell.self, forCellReuseIdentifier: "tvCell2")
        tableView2.backgroundColor = UIColor.cyan
        
        scrollUIView?.addSubview(tableView2)
        
        // 3rd
        let tvFrame3: CGRect = CGRect(x: 424, y: 8, width: 200, height: 300)
        tableView3 = UITableView(frame: tvFrame3)
        tableView3.delegate = self
        tableView3.dataSource = self
        tableView3.register(UITableViewCell.self, forCellReuseIdentifier: "tvCell3")
        tableView3.backgroundColor = UIColor.cyan
        
        scrollUIView?.addSubview(tableView3)
        
        // 4th
        let tvFrame4: CGRect = CGRect(x: 632, y: 8, width: 200, height: 300)
        tableView4 = UITableView(frame: tvFrame4)
        tableView4.delegate = self
        tableView4.dataSource = self
        tableView4.register(UITableViewCell.self, forCellReuseIdentifier: "tvCell4")
        tableView4.backgroundColor = UIColor.cyan
        
        scrollUIView?.addSubview(tableView4)
        
        
        //  create search bar
        let searchBarFrame: CGRect = CGRect(x: 0, y: 250, width: self.view.frame.width, height: 56)
        searchBar = UISearchBar(frame: searchBarFrame)
        searchBar.placeholder = "Search"
        self.view.addSubview(searchBar)
        
        // create collection view
        let collectionViewFrame: CGRect = CGRect(x: 0, y: 306, width: self.view.frame.width, height: 428) // height==428 comes from story board, may change it later
        let flowLayout = UICollectionViewFlowLayout()
        // customize flow layout
        // adjust layout
        let cellSize = CGFloat(160)
        let itemInOneLine = CGFloat(2)
        let totalWidth = self.view.frame.width
        let space = floor((totalWidth - itemInOneLine * cellSize)/(itemInOneLine+1))
        flowLayout.sectionInset = UIEdgeInsets(top: space, left: space, bottom: space, right: space)
        flowLayout.itemSize = CGSize(width: cellSize, height: cellSize)
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        
        collectionView = UICollectionView(frame: collectionViewFrame, collectionViewLayout: flowLayout)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(FuncCollectionViewCell.self, forCellWithReuseIdentifier: "cvCell")
        collectionView.backgroundColor = UIColor.white
        
        self.view.addSubview(collectionView)
        
    }
    
    // functions to conform CollectionView protocols
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return funcs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cvCell", for: indexPath) as! FuncCollectionViewCell
        cell.backgroundColor = UIColor.gray
        cell.funcName.text = funcs[indexPath.row]
        cell.funcName.numberOfLines = 0
        cell.funcName.lineBreakMode = .byWordWrapping

        return cell
    }
    
    // fuction to conform TableView protocols
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableView1 {
            return tv1Data.count
        } else if tableView == tableView2 {
            return tv2Data.count
        } else if tableView == tableView3 {
            return tv3Data.count
        } else {
            return tv4Data.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == tableView1 {
            let cell = tableView1.dequeueReusableCell(withIdentifier: "tvCell1", for: indexPath)
            cell.textLabel!.text = tv1Data[indexPath.row]
            return cell
        } else if (tableView == tableView2) {
            let cell = tableView2.dequeueReusableCell(withIdentifier: "tvCell2", for: indexPath)
            cell.textLabel!.text = tv2Data[indexPath.row]
            return cell
        } else if (tableView == tableView3) {
            let cell = tableView3.dequeueReusableCell(withIdentifier: "tvCell3", for: indexPath)
            cell.textLabel!.text = tv3Data[indexPath.row]
            return cell
        } else {
            let cell = tableView4.dequeueReusableCell(withIdentifier: "tvCell4", for: indexPath)
            cell.textLabel!.text = tv4Data[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if tableView == tableView1 {
            return tvHeaders[0]
        } else if tableView == tableView2 {
            return tvHeaders[1]
        } else if tableView == tableView3 {
            return tvHeaders[2]
        } else {
            return tvHeaders[3]
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == tableView1 {
            showDetailByAlert(title: tvHeaders[0], message: tv1Data[indexPath.row])
        } else if tableView == tableView2 {
            showDetailByAlert(title: tvHeaders[1], message: tv2Data[indexPath.row])
        } else if tableView == tableView3 {
            showDetailByAlert(title: tvHeaders[2], message: tv3Data[indexPath.row])
        } else {
            showDetailByAlert(title: tvHeaders[3], message: tv4Data[indexPath.row])
        }
    }
    
    func showDetailByAlert(title : String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: UIAlertControllerStyle.alert
        )
        let ok = UIAlertAction(
            title: "OK",
            style: UIAlertActionStyle.default,
            handler: nil
        )
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }

}
