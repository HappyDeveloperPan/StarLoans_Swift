//
//  ProductDetailCollectionViewCell.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/12/12.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit

class ProductDetailCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var leftTopLB: UILabel!
    @IBOutlet weak var rightTypeLB: UILabel!
    @IBOutlet weak var rightTypeLB2: UILabel!
    @IBOutlet weak var commitBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.white
        
        layer.cornerRadius = 6
        layer.shadowColor = UIColor.RGB(with: 205, green: 205, blue: 205).cgColor//shadowColor阴影颜色
        layer.shadowOffset = CGSize(width: 0, height: 0)//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
        layer.shadowOpacity = 0.5//阴影透明度，默认0
        layer.shadowRadius = 2//阴影半径，默认3
        layer.masksToBounds = false//   不设置显示不出阴影
        
        //  基本配置
        leftTopLB.layer.borderWidth = 1
        leftTopLB.layer.borderColor = UIColor.white.cgColor
        leftTopLB.layer.cornerRadius = leftTopLB.height/2
        
        rightTypeLB.layer.borderWidth = 0.5
        rightTypeLB.layer.borderColor = kMainColor.cgColor
        rightTypeLB.layer.cornerRadius = 5
        
        rightTypeLB2.layer.borderWidth = 0.5
        rightTypeLB2.layer.borderColor = kMainColor.cgColor
        rightTypeLB2.layer.cornerRadius = 5
        
        commitBtn.layer.cornerRadius = commitBtn.height/2
    }

}
