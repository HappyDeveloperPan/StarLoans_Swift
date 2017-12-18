//
//  MineTableViewCell2.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/12/15.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit

class MineTableViewCell2: UITableViewCell {

    @IBOutlet weak var rightImg: UIImageView!
    @IBOutlet weak var contentLB: UILabel!
    
    fileprivate let cellData:Array<Dictionary<String, Any>> = [["title":"信贷经理认证","rightImg":#imageLiteral(resourceName: "ICON-xindairenzhen")],
                                                               ["title":"设置","rightImg":#imageLiteral(resourceName: "ICON-shezhi")],
                                                               ["title":"常见问题v","rightImg":#imageLiteral(resourceName: "ICON-wenti")],
                                                               ["title":"关于我们","rightImg":#imageLiteral(resourceName: "ICON-about")]]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}

extension MineTableViewCell2 {
    func setCellData(with index: Int) {
        contentLB.text = cellData[index]["title"] as? String
        rightImg.image = cellData[index]["rightImg"] as? UIImage
    }
}
