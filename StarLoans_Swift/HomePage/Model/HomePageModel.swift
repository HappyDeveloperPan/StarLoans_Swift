//
//  HomePageModel.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/12/21.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit
import SwiftyJSON

class HomePageModel: NSObject {
    struct Keys {
        //视频
        static let video_id = "video_id"
        static let videoTitle = "video_title"
        static let videoType = "video_type"
        static let video_img = "video_img"
        //热门代理
        static let product = "product"
        static let interest = "interest"
        static let type = "type"
        static let quota = "quota"
        static let min_term = "min_term"
        static let add_time = "add_time"
        static let small_img = "small_img"
        static let img = "img"
        static let logo = "logo"
        static let card = "card"
        static let position = "position"
        static let interest_type = "interest_type"
        static let max_term = "max_term"
        
    }
    
    public var video_id: Int = 0
    public var videoTitle: String = ""
    public var videoType: Int = 0
    public var video_img: String = ""
    
    
    public init(with json:JSON) {
        let appInfo = json
        self.video_id = appInfo[Keys.video_id].intValue
        self.videoTitle = appInfo[Keys.videoTitle].stringValue
        self.videoType = appInfo[Keys.videoType].intValue
        self.video_img = appInfo[Keys.video_img].stringValue
    }
    
    override init() {
        super .init()
    }
    
    func getVideoType() -> String {
        switch videoType {
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
