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
        static let cause = "cause"
        static let resultnumber = "resultnumber"
        static let token = "token"
        static let yzm = "yzm"
        static let keys11 = "keys11"
        static let shouji = "shouji"
        static let user = "user"
    }
    
    public var phoneNumber: String = ""
    public var password: String = ""
    public var cause: String = ""
    public var resultnumber: Int = 0
    public var token: String = ""
    public var yzm: String = ""
    public var keys11: String = ""
    public var shouji: String = ""
    public var user: String = ""
    
    public init(with json:JSON) {
        let appInfo = json
        self.phoneNumber = appInfo[Keys.phoneNumber].stringValue
        self.password = appInfo[Keys.password].stringValue
        self.cause = appInfo[Keys.cause].stringValue
        self.resultnumber = appInfo[Keys.resultnumber].intValue
        self.token = appInfo[Keys.token].stringValue
        self.yzm = appInfo[Keys.yzm].stringValue
        self.keys11 = appInfo[Keys.keys11].stringValue
        self.shouji = appInfo[Keys.shouji].stringValue
        self.user = appInfo[Keys.user].stringValue
    }

    override init() {
        super .init()
    }
    
}
