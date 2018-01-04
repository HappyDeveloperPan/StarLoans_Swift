//
//  HotResourceCell.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/12/25.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit

class HotResourceCell: UICollectionViewCell, RegisterCellOrNib {
    @IBOutlet weak var userNameLB: UILabel!         //  用户姓名
    @IBOutlet weak var userTypeImg: UIImageView!    //  用户类型
    @IBOutlet weak var resourceType: UILabel!       //  资源类型
    @IBOutlet weak var houseInfoLB: UILabel!        //  房屋情况
    @IBOutlet weak var carInfoLB: UILabel!          //  车辆情况
    @IBOutlet weak var incomeLB: UILabel!           //  收入
    @IBOutlet weak var loansNumLB: UILabel!         //  贷款金额
    @IBOutlet weak var priceBtn: UIButton!          //  资源价格
    @IBOutlet weak var accountLB: UILabel!          //  户口
    @IBOutlet weak var socialSecurityLB: UILabel!   //  社保
    @IBOutlet weak var providentFundLB: UILabel!    //  公积金
    @IBOutlet weak var needDayLB: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.white
        layer.cornerRadius = 6
        layer.shadowColor = kLineColor.cgColor//shadowColor阴影颜色
        layer.shadowOffset = CGSize(width: 2, height: 2)//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
        layer.shadowOpacity = 0.5//阴影透明度，默认0
        layer.shadowRadius = 2//阴影半径，默认3
        layer.masksToBounds = false
        
        userNameLB.sizeToFit()
        resourceType.layer.backgroundColor = UIColor.RGB(with: 248, green: 225, blue: 225).cgColor
        resourceType.layer.cornerRadius = 10.5
        priceBtn.layer.cornerRadius = priceBtn.height/2
        accountLB.layer.borderWidth = 0.5
        accountLB.layer.borderColor = kMainColor.cgColor
        accountLB.layer.cornerRadius = 5
        socialSecurityLB.layer.borderWidth = 0.5
        socialSecurityLB.layer.borderColor = kMainColor.cgColor
        socialSecurityLB.layer.cornerRadius = 5
        providentFundLB.layer.borderWidth = 0.5
        providentFundLB.layer.borderColor = kMainColor.cgColor
        providentFundLB.layer.cornerRadius = 5
    }

    @IBAction func priceBtnClick(_ sender: UIButton) {
    }
}

extension HotResourceCell {
    func setHotResourceCellData(with cellData: ClientInfoModel) {
        userNameLB.text = cellData.client_name
        userTypeImg.image = cellData.getTypeImage()
        resourceType.text = cellData.getpledgeType()
        loansNumLB.text = String(cellData.client_loan_need/10000) + "万"
        houseInfoLB.text = cellData.getHouseInfo()
        carInfoLB.text = cellData.getCarInfo()
        incomeLB.text = cellData.getIncomePayType()
        accountLB.isHidden = !cellData.client_is_shenzhen_census.getServiceBool()
        socialSecurityLB.isHidden = !cellData.client_is_social_security.getServiceBool()
        providentFundLB.isHidden = !cellData.client_is_accumulated_funds.getServiceBool()
        needDayLB.text = "需求程度" + String(cellData.client_days_need) + "天"
        priceBtn.setTitle(String(cellData.client_price) + "元抢单", for: .normal)
    }
}
