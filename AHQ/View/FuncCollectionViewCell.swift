//
//  FuncCollectionViewCell.swift
//  AHQ
//
//  Created by LIYU ZHANG on 11/5/18.
//  Copyright © 2018 liyuzhang. All rights reserved.
//

import UIKit

class FuncCollectionViewCell: UICollectionViewCell {
    let funcName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = UIColor.white
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let labelFrame: CGRect = CGRect(x: 20, y: 40, width: 120, height: 80)
        funcName.frame = labelFrame
        addSubview(funcName)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
