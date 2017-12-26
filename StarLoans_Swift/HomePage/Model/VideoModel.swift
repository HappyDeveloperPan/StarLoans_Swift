//
//  VideoModel.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/12/26.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit
import SwiftyJSON

//video_id    int(11)    视频ID
//video_title    int(11)    视频标题
//video_desc    tinyint(3)    视频描述
//video_price    tinyint(3)    视频价格
//video_view_count    int(11)    视频观看次数
//video_address    string(32)    视频地址
//video_type    tinyint(3)    视频分类，1热门视频，2产品视频，3路演视频


class VideoModel: NSObject {
    struct Keys {
        static let video_id = "video_id"
        static let video_title = "video_title"
        static let video_desc = "video_desc"
        static let video_price = "video_price"
        static let video_view_count = "video_view_count"
        static let video_address = "video_address"
        static let video_type = "video_type"
    }
    
    public var video_id: Int = 0
    public var video_title: String = ""
    public var video_desc: String = ""
    public var video_price: Float = 0
    public var video_view_count: Int = 0
    public var video_address: String = ""
    public var video_type: Int = 0
    
    public init(with json:JSON) {
        let appInfo = json
        self.video_id = appInfo[Keys.video_id].intValue
        self.video_title = appInfo[Keys.video_title].stringValue
        self.video_desc = appInfo[Keys.video_desc].stringValue
        self.video_price = appInfo[Keys.video_price].floatValue
        self.video_view_count = appInfo[Keys.video_view_count].intValue
        self.video_address = appInfo[Keys.video_address].stringValue
        self.video_type = appInfo[Keys.video_type].intValue
    }
    
    override init() {
        super .init()
    }
}

extension VideoModel {
    func getVideoType() ->String {
        switch video_type {
        case 1:
            return "热门视频"
        case 2:
            return "产品视频"
        case 3:
            return "路演视频"
        default:
            return ""
        }
    }
}
