//
//  File.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/12/19.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import Foundation

///  服务器地址
///  线上服务器
public let hostAdress = "http://120.78.171.83/index.php?s="
///  线上图片地址头
public let picAdress = "http://120.78.171.83"
///  魏兄服务器
//public let hostAdress = "http://192.168.2.15/index.php?s="
///  娟姐服务器
//public let hostAdress = "http://192.168.2.19/index.php?s="

//MARK: - 登录接口
///  用户登录
public let kUrl_Login = hostAdress + "/Home/MobileIndex/mobile_ajax_login_ag"
///  自动登录
public let kUrl_AutoLogin = hostAdress + "/Home/MobileIndex/fase_login"
///  获取验证码
public let kUrl_GetCode = hostAdress + "/Home/MobileIndex/mobile_yzms"
///  用户注册
public let kUrl_Register = hostAdress + "/Home/MobileIndex/mobile_ajax_reg_ag"
///  忘记密码
public let kUrl_ForgetPWD = hostAdress + "/Home/MobileIndex/mobile_ajax_ag_fg"

//MARK: - 首页接口
///  首页广告图
public let kUrl_HomePageTopBanner = hostAdress + "/Home/MobileAppBanner/index"
///  热门视频
public let kUrl_HotVideo = hostAdress + "/Home/MobileVideo/getHotVideo"
///  热门产品
public let kUrl_HotProduct = hostAdress + "/Home/MobileHotProduct/Third"
///  底部广告图
public let kUrl_BottomBanner = hostAdress + "/Home/mobileFooterAdvertisement/footer_advertisement_image"
///  热门抢单
public let kUrl_HotQuickRob = hostAdress + "/Home/QuickBill/getHotBill"

///  贷款学院
public let kUrl_LoanCollege = hostAdress + "/Home/MobileLoanCollege/index"
///  行业资讯
public let kUrl_IndustryResources = hostAdress + "/Home/MobileIndustryResources/index"
///  资讯研读
public let kUrl_InfoStudying = hostAdress + "/Home/MobileInformationStudy/index"
///  视频中心
public let kUrl_VideoCenter = hostAdress + "/Home/MobileVideo/index"
///  视频详情
public let kUrl_VideoDetail = hostAdress + "/Home/MobileVideo/getVideoInfo"












