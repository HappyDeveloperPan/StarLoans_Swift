//
//  ProductAgency.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/12/23.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit
import SwiftyJSON

//Data. product    String    产品名称
//Data. quota    String    最高额度（万元）
//Data . producttype    String    真正的产品类型
//Data .return_Commission    varchar    返佣
//Data . Claim_amount    varchar    领取金额
//Data . Leader_number    int    已领人数

class ProductAgencyModel: NSObject {
    struct Keys {
        static let product = "product"
        static let quota = "quota"
        static let producttype = "producttype"
        static let return_commission = "return_commission"
        static let claim_amount = "claim_amount"
        static let leader_number = "leader_number"
    }
    
    public var product: String = ""
    public var quota: String = ""
    public var producttype: String = ""
    public var return_commission: String = ""
    public var claim_amount: String = ""
    public var leader_number: Int = 0
    
    public init(with json:JSON) {
        let appInfo = json
        self.product = appInfo[Keys.product].stringValue
        self.quota = appInfo[Keys.quota].stringValue
        self.producttype = appInfo[Keys.producttype].stringValue
        self.return_commission = appInfo[Keys.return_commission].stringValue
        self.claim_amount = appInfo[Keys.claim_amount].stringValue
        self.leader_number = appInfo[Keys.leader_number].intValue
    }
    
    override init() {
        super .init()
    }
}
