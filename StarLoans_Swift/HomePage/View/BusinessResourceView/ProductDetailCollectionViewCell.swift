//
//  ProductDetailCollectionViewCell.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/12/12.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit

class ProductDetailCollectionViewCell: UICollectionViewCell, RegisterCellOrNib {
    
    @IBOutlet weak var topBackImg: UIImageView!
    @IBOutlet weak var titleLB: UILabel!
    @IBOutlet weak var leftTopLB: UILabel!
    
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var loansNumLB: UILabel!
    
    @IBOutlet weak var centerTitleTop: UILabel!
    @IBOutlet weak var centerContentTop: UILabel!
    @IBOutlet weak var centerTitleCenter: UILabel!
    @IBOutlet weak var centerContentCenter: UILabel!
    @IBOutlet weak var centerTitleBottom: UILabel!
    @IBOutlet weak var centerContentBottom: UILabel!
    
    
    @IBOutlet weak var rightTypeLB: UILabel!
    @IBOutlet weak var rightTypeLB2: UILabel!
    
    @IBOutlet weak var commitBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.white
        
        layer.cornerRadius = 6
        layer.shadowColor = UIColor.RGB(with: 205, green: 205, blue: 205).cgColor//shadowColor阴影颜色
        layer.shadowOffset = CGSize(width: 2, height: 2)//shadowOffset阴影偏移,x向右偏移4，y向下偏移4，默认(0, -3),这个跟shadowRadius配合使用
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

    @IBAction func commitBtnClick(_ sender: UIButton) {
        //如果用户没有登录就跳转到登录界面
        guard UserManager.shareManager.isLogin else {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: kPresentLogin), object: nil)
            return
        }
        //TODO: - 界面跳转以后修改
        let vc = LoansDetailViewController.loadStoryboard()
        let topViewController = Utils.currentTopViewController()
        if topViewController?.navigationController != nil{
            topViewController?.navigationController?.pushViewController(vc, animated: true)
        }else{
            topViewController?.present(vc, animated: true , completion: nil)
        }
    }
}

extension ProductDetailCollectionViewCell {
    func setCellData(with index: Int) {
        if index == 0 {
            topBackImg.image = #imageLiteral(resourceName: "ICON-jianbianban")
            centerTitleTop.text = "返佣"
            centerTitleCenter.text = "领取金额"
            centerTitleBottom.text = "已领人数"
            commitBtn.setTitle("领取任务", for: .normal)
        }else {
            topBackImg.image = #imageLiteral(resourceName: "ICON-disanfangkapian-")
            centerTitleTop.text = "利率"
            centerTitleCenter.text = "贷款期限"
            centerTitleBottom.text = "交单人数"
            commitBtn.setTitle("申请交单", for: .normal)
        }
    }
}
