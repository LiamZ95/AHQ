//
//  FeedViewController.swift
//  AHQ
//
//  Created by LIYU ZHANG on 13/4/18.
//  Copyright © 2018 liyuzhang. All rights reserved.
//

import UIKit

class FeedViewController: UICollectionViewController {
    let cellId: String = "feedCellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor.brown
        
        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        return cell
    }
}
