//
//  ProductModel.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/12/31.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit
import SwiftyJSON

//Data.id    int    贷款产品表id
//Data. card    String    所属类别([个人类],[企业类])
//Data. type    string    类(例：[信用类]，[抵押类]，[有房产，周转，创业，结婚，旅游类])
//Data. product    string    产品名称
//Data. cooperation_bank    string    合作银行
//Data. label    string    要求标签(例:无需抵押物)
//Data. lend_term    Int    放款时间（天）
//Data. quota    string    最高额度（万元）
//Data. return_commission    string    返佣
//Data. claim_amount    string    领取金额
//Data. leader_number    int    已领人数


class ProductModel: NSObject {
    struct Keys {
        static let product = "product"
        static let quota = "quota"
        static let producttype = "producttype"
        static let return_commission = "return_commission"
        static let claim_amount = "claim_amount"
        static let leader_number = "leader_number"
        static let card = "card"
        static let cooperation_bank = "cooperation_bank"
        static let fast_loan = "fast_loan"
        static let label = "label"
        static let lend_term = "lend_term"
    }
    
    public var product: String = ""
    public var quota: String = ""
    public var producttype: String = ""
    public var return_commission: String = ""
    public var claim_amount: String = ""
    public var leader_number: Int = 0
    public var card: String = ""
    public var cooperation_bank: String = ""
    public var fast_loan: ServiceBool = .serviceFalse
    public var label: String = ""
    public var lend_term: Int = 0
    
    public init(with json:JSON) {
        let appInfo = json
        self.product = appInfo[Keys.product].stringValue
        self.quota = appInfo[Keys.quota].stringValue
        self.producttype = appInfo[Keys.producttype].stringValue
        self.return_commission = appInfo[Keys.return_commission].stringValue
        self.claim_amount = appInfo[Keys.claim_amount].stringValue
        self.leader_number = appInfo[Keys.leader_number].intValue
        self.card = appInfo[Keys.card].stringValue
        self.cooperation_bank = appInfo[Keys.cooperation_bank].stringValue
        self.fast_loan = ServiceBool(with: appInfo[Keys.fast_loan].intValue)
        self.label = appInfo[Keys.label].stringValue
        self.lend_term = appInfo[Keys.lend_term].intValue
    }
    
    override init() {
        super .init()
    }
}
