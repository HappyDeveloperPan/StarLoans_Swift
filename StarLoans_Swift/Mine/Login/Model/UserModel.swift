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
    }
    
    public var phoneNumber: String = ""
    public var password: String = ""
    public var cause: String = ""
    public var resultnumber: Int = 0
    
    public init(with json:JSON) {
        let appInfo = json
        self.phoneNumber = appInfo[Keys.phoneNumber].stringValue
        self.password = appInfo[Keys.password].stringValue
        self.cause = appInfo[Keys.cause].stringValue
        self.resultnumber = appInfo[Keys.resultnumber].intValue
    }

}
