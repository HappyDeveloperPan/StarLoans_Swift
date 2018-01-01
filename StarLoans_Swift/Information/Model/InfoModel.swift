//
//  InfoModel.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2018/1/1.
//  Copyright © 2018年 iOS Pan. All rights reserved.
//

import UIKit
import SwiftyJSON
//message_id    int(11)    消息id
//message_type    tinyint(11)    消息类型，1系统消息2交易消息
//message_title    string(32)    标题
//message_desc    string(255)    内容
//message_time    int(32)    发送时间
//message_read    tinyint(3)    是否已读，1未读2已读

class InfoModel: NSObject {
    struct Keys {
        static let message_id = "message_id"
        static let message_type = "message_type"
        static let message_title = "message_title"
        static let message_desc = "message_desc"
        static let message_time = "message_time"
        static let message_read = "message_read"
    }
    
    public var message_id: Int = 0
    public var message_type: Int = 0
    public var message_title: String = ""
    public var message_desc: String = ""
    public var message_time: Double = 0
    public var message_read: ServiceBool = .serviceFalse
    
    public init(with json:JSON) {
        let appInfo = json
        self.message_id = appInfo[Keys.message_id].intValue
        self.message_type = appInfo[Keys.message_type].intValue
        self.message_title = appInfo[Keys.message_title].stringValue
        self.message_desc = appInfo[Keys.message_desc].stringValue
        self.message_time = appInfo[Keys.message_time].doubleValue
        self.message_read = ServiceBool(with: appInfo[Keys.message_read].intValue)
    }
    
    override init() {
        super .init()
    }
}
