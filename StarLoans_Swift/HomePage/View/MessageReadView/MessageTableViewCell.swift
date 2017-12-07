//
//  MessageTableViewCell.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/12/7.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    @IBOutlet weak var messImageView: UIImageView!
    @IBOutlet weak var readNumber: UILabel!
    @IBOutlet weak var contentLB: UILabel!
    @IBOutlet weak var timeLB: UILabel!
    
    //MARK: - 生命周期
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        
        let attribute = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
        let lableSize = contentLB.text?.boundingRect(with: CGSize(width: contentLB.frame.size.width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: attribute, context: nil).size
        contentLB.frame = CGRect(x: contentLB.frame.origin.x, y: contentLB.frame.origin.y, width: contentLB.frame.size.width, height: (lableSize?.height)!)
        contentLB.numberOfLines = 2
        contentLB.sizeToFit()
        contentLB.text = "时刻发挥闪电发货后开始疯狂就是放假了时间了房价栏数据发了时间了房价类似纠纷时间浪费经历是放假了螺蛳粉逻辑是否了解老司机"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
