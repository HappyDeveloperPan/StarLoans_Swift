//
//  File.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/11/8.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit
import SnapKit

///颜色
public let kMainColor = UIColor(red: 242/255, green: 56/255, blue: 61/255, alpha: 1)
public let kTextColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1)
public let kTitleColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
public let kLineColor = UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1)
public let kHomeBackColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)

///主窗口
let kMainWindow  = UIApplication.shared.delegate?.window
///主窗口frame
let kMainScreenFrame = UIScreen.main.bounds
/// 屏幕的宽
let kScreenWidth = UIScreen.main.bounds.width
/// 屏幕的高
let kScreenHeight = UIScreen.main.bounds.height
/// 导航栏高度
let kNavHeight = UIApplication.shared.statusBarFrame.size.height + 44
/// 状态栏高度
let kStatusHeight = UIApplication.shared.statusBarFrame.size.height
/// idfv
let idfv = UIDevice.current.identifierForVendor?.uuidString
/// 版本号
let versionCode = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
/// 系统版本号
let systemVersion = UIDevice.current.systemVersion

//存储字段
let kSavedUser = "savedUser" ///用户数据

