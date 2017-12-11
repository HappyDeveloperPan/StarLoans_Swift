//
//  PushViewCollectionViewCell.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/12/9.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit

class PushViewCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentLB: UILabel!
    @IBOutlet weak var cutLine: UIImageView!
    @IBOutlet weak var titileLB: UILabel!
    @IBOutlet weak var contentImg: UIImageView!
    @IBOutlet weak var commitBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commitBtn.layer.cornerRadius = 22.5
        
//        contentLB.size = CGSize(width: width - 32, height: 20)
        contentLB.text = "时刻发挥闪电发货后开始疯狂就是放假了时间了房价栏数据发了时间了房价类似纠纷时间浪费经历是放假了螺蛳粉逻辑是否了解老司机"
//        let attribute = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
//        let lableSize = contentLB.text?.boundingRect(with: CGSize(width: contentLB.frame.size.width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: attribute, context: nil).size
//        contentLB.frame = CGRect(x: contentLB.frame.origin.x, y: contentLB.frame.origin.y, width: kScreenWidth - 32, height: (lableSize?.height)!)
//        
//        contentLB.font = UIFont.systemFont(ofSize: 14)
    }
    
    override func layoutSubviews() {
        super .layoutSubviews()
        
        contentLB.snp.makeConstraints { (make) in
            make.width.equalTo(kScreenWidth - 32)
            make.height.equalTo(80)
        }
        contentLB.numberOfLines = 0
        contentLB.sizeToFit()
        contentLB.layoutIfNeeded()

    }

}
