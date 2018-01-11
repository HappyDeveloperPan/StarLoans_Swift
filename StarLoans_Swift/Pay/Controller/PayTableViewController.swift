//
//  PayTableViewController.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2018/1/10.
//  Copyright © 2018年 iOS Pan. All rights reserved.
//

import UIKit
import IBAnimatable

class PayTableViewController: UITableViewController {
    @IBOutlet weak var moneyLB: UILabel!
    @IBOutlet weak var countDownLB: UILabel!
    @IBOutlet weak var selectImgOne: UIImageView!
    @IBOutlet weak var selectImgTwo: UIImageView!
    
    ///支付类型
    fileprivate enum PayType: Int{
        case balance = 0    //余额
        case Wechat = 1     //微信支付
    }
    
    fileprivate var payType: PayType = .balance
    
    var selectImgArr = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = kHomeBackColor
        selectImgArr.append(selectImgOne)
        selectImgArr.append(selectImgTwo)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        payType = PayTableViewController.PayType(rawValue: indexPath.row)!
        for i in 0...selectImgArr.count - 1 {
            let imageView = selectImgArr[i]
            if indexPath.row == i {
                imageView.image = #imageLiteral(resourceName: "ICON-xuanzhong")
            }else {
                imageView.image = #imageLiteral(resourceName: "ICON-weixuanzhong")
            }
        }
    }
    

    @IBAction func payBtnClick(_ sender: AnimatableButton) {
        switch payType {
        case .balance:
            break
        case .Wechat:
            let req = PayReq()
            req.partnerId = WXAppID
            req.prepayId = "23424524342"
            req.nonceStr = "sdfhskjfsjf"
            req.timeStamp = 2342343
            req.package = WXAPI
            req.sign = WXAPI
            WXApi.send(req)
        }
        //调起微信支付
//                let req = PayReq()
        //        /** 商家向财付通申请的商家id */
        //        @property (nonatomic, retain) NSString *partnerId;
        //        /** 预支付订单 */
        //        @property (nonatomic, retain) NSString *prepayId;
        //        /** 随机串，防重发 */
        //        @property (nonatomic, retain) NSString *nonceStr;
        //        /** 时间戳，防重发 */
        //        @property (nonatomic, assign) UInt32 timeStamp;
        //        /** 商家根据财付通文档填写的数据和签名 */
        //        @property (nonatomic, retain) NSString *package;
        //        /** 商家根据微信开放平台文档对数据做的签名 */
        //        @property (nonatomic, retain) NSString *sign;
//                req.partnerId = WXAppID
//                req.prepayId = "23424524342"
//                req.nonceStr = "sdfhskjfsjf"
//                req.timeStamp = 2342343
//                req.package = WXAPI
//                req.sign = WXAPI
//                WXApi.send(req)
    }
}
