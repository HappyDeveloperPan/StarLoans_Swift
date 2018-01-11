//
//  PayModel.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2018/1/10.
//  Copyright © 2018年 iOS Pan. All rights reserved.
//

import UIKit
import SwiftyJSON

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

class PayModel: NSObject {
    struct Keys {
        static let partnerId = "partnerId"
        static let prepayId = "prepayId"
        static let nonceStr = "nonceStr"
        static let timeStamp = "timeStamp"
        static let package = "package"
        static let sign = "sign"
    }
    
    public var partnerId: String = ""
    public var prepayId: String = ""
    public var nonceStr: String = ""
    public var timeStamp: UInt32 = 0
    public var package: String = ""
    public var sign: String = ""
    
    public init(with json:JSON) {
        let appInfo = json
        self.partnerId = appInfo[Keys.partnerId].stringValue
        self.prepayId = appInfo[Keys.prepayId].stringValue
        self.nonceStr = appInfo[Keys.nonceStr].stringValue
        self.timeStamp = appInfo[Keys.timeStamp].uInt32Value
        self.package = appInfo[Keys.package].stringValue
        self.sign = appInfo[Keys.sign].stringValue
    }
    
    override init() {
        super .init()
    }
}
