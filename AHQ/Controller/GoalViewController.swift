//
//  GoalViewController.swift
//  AHQ
//
//  Created by LIYU ZHANG on 17/4/18.
//  Copyright © 2018 liyuzhang. All rights reserved.
//

import UIKit

class GoalViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDataSource, UITableViewDelegate{
    
    var scrollView: UIScrollView?
    var scrollUIView: UIView?
    var searchBar: UISearchBar!
    var collectionView: UICollectionView!
    var tableView: UITableView!
    
    var sections = ["Major goal", "Sub-goals"]
    var s1Content = ["Make national team in June 2018"]
    var s2Content = ["Get down to 9% body fat and 88kg", "Get av.workout consistency above 90%"]
    
    var sectionData: [Int:[String]] = [:]
    
    var funcs = ["Workouts", "Functional movement", "Athletic testing", "Self reporting"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create srcollview
        let scrollViewFrame: CGRect = CGRect(x: 0, y: 0, width: 375, height: 250)
        scrollView = UIScrollView(frame: scrollViewFrame)
        self.view.addSubview(scrollView!)
        
        // create UIView inside scrollView
        let scrollUIViewFrame: CGRect = CGRect(x: 0, y: 0, width: 375, height: 250)
        scrollUIView = UIView(frame: scrollUIViewFrame)
        scrollView!.addSubview(scrollUIView!)
        
        // set gradient color for view in scrollview
        let backgroundLayer = CAGradientLayer().setGradientBackground()
        // set gradient from left to right
        backgroundLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        backgroundLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        backgroundLayer.frame = scrollUIView!.bounds
        scrollUIView!.layer.insertSublayer(backgroundLayer, at: 0)
        
        // create table view
        let tvFrame: CGRect = CGRect(x: 8, y: 8, width: 359, height: 250)
        tableView = UITableView(frame: tvFrame)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "tvCell")
        tableView.backgroundColor = UIColor.cyan
        // for multisection
        sectionData = [0: s1Content, 1: s2Content]
        
        scrollUIView?.addSubview(tableView)
        
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
        cell.backgroundColor = UIColor.gray
        cell.funcName.text = funcs[indexPath.row]
        cell.funcName.numberOfLines = 0
        cell.funcName.lineBreakMode = .byWordWrapping
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (sectionData[section]?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tvCell", for: indexPath)
        cell.textLabel!.text = sectionData[indexPath.section]![indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

}
