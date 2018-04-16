//
//  TestCollectionViewController.swift
//  AHQ
//
//  Created by LIYU ZHANG on 13/4/18.
//  Copyright © 2018 liyuzhang. All rights reserved.
//

import UIKit

private let reuseIdentifier = "testCell"

class TestCollectionViewController: UICollectionViewController {
// , UICollectionViewDelegateFlowLayout
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
        self.collectionView!.register(TestCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
//
//        // Configure the cell
//         cell.backgroundColor = UIColor.red
//
//
//        return cell
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TestCollectionViewCell
        
        
        
//        cell.contentLabel.text = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
//
//        cell.nameLabel.text = "Peter"
//        cell.otherLabel.text = "14/04/2018"

        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width, height: 200)
//    }

}
