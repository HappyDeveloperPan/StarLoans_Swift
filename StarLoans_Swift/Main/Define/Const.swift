//
//  File.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/11/8.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit
import SnapKit

public let hostAdress = "http://www.baidu.com"
///颜色
public let kMainColor = UIColor(red: 242/255, green: 56/255, blue: 61/255, alpha: 1)
public let kTextColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1)
public let kTitleColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
public let kLineColor = UIColor(red: 181/255, green: 181/255, blue: 181/255, alpha: 1)
public let kHomeBackColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)


///主窗口
let kMainWindow  = UIApplication.shared.delegate?.window
/// 屏幕的宽
let kScreenWidth = UIScreen.main.bounds.width
/// 屏幕的高
let kScreenHeight = UIScreen.main.bounds.height

/// idfv
let idfv = UIDevice.current.identifierForVendor?.uuidString
/// 版本号
let versionCode = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
/// 系统版本号
let systemVersion = UIDevice.current.systemVersion


