//
//  PayTableViewController.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2018/1/10.
//  Copyright © 2018年 iOS Pan. All rights reserved.
//

import UIKit
import IBAnimatable

public let kWechatPayResult = "WechatPayResult"

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
        
        NotificationCenter.default.addObserver(self, selector: #selector(WechatPayResult(notif:)), name: NSNotification.Name(rawValue: kWechatPayResult), object: nil)
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
            WechatPay()
        }
    }
}

extension PayTableViewController {
    ///调起微信支付
    func WechatPay() {
        
        JSProgress.showBusy()
        
        var parameters = [String: Any]()
        parameters["goods_id"] = 35
        parameters["appid"] = WXAppID
        parameters["total_fee"] = 0.1
        
        NetWorksManager.requst(with: kUrl_WeChatPay, type: .post, parameters: parameters) { (jsonData, error) in
            if jsonData?["status"] == 200 {
                if let data = jsonData?["data"]{
                    let payModel = PayModel(with: data)
                    let req = PayReq()
                    req.openID = payModel.appid
                    req.partnerId = payModel.partnerid
                    req.prepayId = payModel.prepayid
                    req.nonceStr = payModel.noncestr
                    req.timeStamp = payModel.timestamp
                    req.package = payModel.package
                    req.sign = payModel.sign
                    WXApi.send(req)
                }
            }else {
                if error == nil {
                    if let msg = jsonData?["msg_zhcn"].stringValue {
                        JSProgress.showFailStatus(with: msg)
                    }
                }else {
                    JSProgress.showFailStatus(with: "请求失败")
                }
            }
            JSProgress.hidden()
        }
    }
    
    ///微信支付成功回调服务器
    @objc func WechatPayResult(notif:NSNotification?) {
//        let notiInfo = notif?.object
        
    }
}
