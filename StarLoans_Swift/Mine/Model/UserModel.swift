//
//  UserModel.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/11/24.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit
import SwiftyJSON

class UserModel: NSObject {
    
    struct Keys {
        static let phoneNumber = "phoneNumber"
        static let password = "password"
        static let token = "token"
        static let yzm = "yzm"
        static let user = "user"                    //用户名
        static let tx = "tx"                        //头像
        static let is_audit = "is_audit"       //是否认证经纪人，1未认证2审核中3认证不成功4认证成功
        static let type = "type"                    //用户类型，1第三方经纪人，2机构经理，3平台信贷经理
    }
    
    public var phoneNumber: String = ""
    public var password: String = ""
    public var token: String = ""
    public var yzm: String = ""
    public var user: String = ""
    public var tx: String = ""
    public var is_audit: Int = 0
    public var type: Int = 0
    
    public init(with json:JSON) {
        let appInfo = json
        self.phoneNumber = appInfo[Keys.phoneNumber].stringValue
        self.password = appInfo[Keys.password].stringValue
        self.token = appInfo[Keys.token].stringValue
        self.yzm = appInfo[Keys.yzm].stringValue
        self.user = appInfo[Keys.user].stringValue
        self.tx = appInfo[Keys.tx].stringValue
        self.is_audit = appInfo[Keys.is_audit].intValue
        self.type = appInfo[Keys.type].intValue
    }

    override init() {
        super .init()
    }
    
    func getAuditStatus() -> String {
        switch is_audit {
        case 1:
            return "未认证"
        case 2:
            return "审核中"
//        case 3:
//            return "认证失败"
//        case 4:
//            return "认证成功"
        default:
            return "未认证"
        }
    }
    
    func getApproveType() ->String {
        switch type {
        case 1:
            return "经纪人"
        case 2:
            return "机构经理"
        case 3:
            return "信贷经理"
        default:
            return "未认证"
        }
    }
    
}
