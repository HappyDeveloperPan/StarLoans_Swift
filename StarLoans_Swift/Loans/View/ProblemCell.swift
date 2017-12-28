//
//  ProblemCell.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/12/27.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit

class ProblemCell: UITableViewCell, RegisterCellOrNib {
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var timeLB: UILabel!
    @IBOutlet weak var problemLB: UILabel!
    @IBOutlet weak var answerLB: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        answerLB.sizeToFit()
        answerLB.numberOfLines = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
