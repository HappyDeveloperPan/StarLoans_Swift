//
//  RobbingTableViewCell.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/12/6.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit

class RobbingTableViewCell: UITableViewCell {

    //FIXME: -
    //MARK: -
    //TODO: -
    
    @IBOutlet weak var userNameLB: UILabel!
    @IBOutlet weak var userTypeImg: UIImageView!
    @IBOutlet weak var pledgeTypeLB: UILabel!
    @IBOutlet weak var moneyLB: UILabel!
    @IBOutlet weak var robbingBtn: UIButton!
    @IBOutlet weak var lbTypeBtn: UILabel!
    @IBOutlet weak var cbTypeBtn: UILabel!
    @IBOutlet weak var rbTypeBtn: UILabel!
    @IBOutlet weak var needDayBtn: UILabel!
    
    //MARK: - 生命周期
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        
        pledgeTypeLB.layer.backgroundColor = UIColor.RGB(with: 248, green: 225, blue: 225).cgColor
        pledgeTypeLB.layer.cornerRadius = 10.5
        robbingBtn.layer.cornerRadius = robbingBtn.height/2
        lbTypeBtn.layer.borderWidth = 0.5
        lbTypeBtn.layer.borderColor = kMainColor.cgColor
        lbTypeBtn.layer.cornerRadius = 5
        cbTypeBtn.layer.borderWidth = 0.5
        cbTypeBtn.layer.borderColor = kMainColor.cgColor
        cbTypeBtn.layer.cornerRadius = 5
        rbTypeBtn.layer.borderWidth = 0.5
        rbTypeBtn.layer.borderColor = kMainColor.cgColor
        rbTypeBtn.layer.cornerRadius = 5
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
