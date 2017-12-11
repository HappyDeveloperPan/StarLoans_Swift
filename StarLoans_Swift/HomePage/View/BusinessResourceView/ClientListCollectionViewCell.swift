//
//  ClientListCollectionViewCell.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/12/11.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit

class ClientListCollectionViewCell: UICollectionViewCell {
    
    //MARK: - 生命周期
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = kHomeBackColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
