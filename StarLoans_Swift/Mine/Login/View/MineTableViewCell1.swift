//
//  MineTableViewCell1.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/12/15.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit

enum cellContent {
    case justMoney
    case moreContent
}

class MineTableViewCell1: UITableViewCell, LoadNibProtocol {

    @IBOutlet weak var rightImg: UIImageView!
    @IBOutlet weak var titleLB: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        setUI()
    }
    
    func setUI() {
        for index in 0...3 {
            let numberLB = UILabel()
            numberLB.textColor = kMainColor
            numberLB.textAlignment = .center
            numberLB.font = UIFont.systemFont(ofSize: 16)
            numberLB.tag = index + 1
            numberLB.text = "0"
            contentView.addSubview(numberLB)
            
            let nameLB = UILabel()
            nameLB.textColor = kTitleColor
            nameLB.textAlignment = .center
            nameLB.font = UIFont.systemFont(ofSize: 12)
            nameLB.tag = (index + 1) * 10
            nameLB.text = "我的订单"
            contentView.addSubview(nameLB)
        }
    }
    
    override func layoutSubviews() {
        let labWidth = (contentView.width-30) / 4
        
        for index in 0...3 {
            let numberLB = viewWithTag(index + 1) as! UILabel
            numberLB.snp.makeConstraints({ (make) in
                make.centerY.equalToSuperview()
                make.left.equalTo(labWidth * CGFloat(index))
                make.size.equalTo(CGSize(width: labWidth, height: 20))
            })
            numberLB.layoutIfNeeded()
            
            let nameLB = viewWithTag((index + 1)*10) as! UILabel
            nameLB.snp.makeConstraints({ (make) in
                make.top.equalTo(numberLB.snp.bottom).offset(8)
                make.left.equalTo(labWidth * CGFloat(index))
                make.size.equalTo(CGSize(width: labWidth, height: 20))
            })
            nameLB.layoutIfNeeded()
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
