//
//  TestCollectionViewController.swift
//  AHQ
//
//  Created by LIYU ZHANG on 13/4/18.
//  Copyright © 2018 liyuzhang. All rights reserved.
//

import UIKit

private let reuseIdentifier = "testCell"

class FeedViewController: UICollectionViewController {
//    , UICollectionViewDelegateFlowLayout
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cell classes
//        self.collectionView!.register(TestCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Configure the cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FeedViewCell
        
        cell.nameLabel.text = "Peter"
        cell.otherLabel.text = "13/04/2018"
        cell.profileImageView.image = UIImage(named: "user")

        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: view.frame.width, height: 200)
//    }

}
