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
public let kUrl_HotVideo = hostAdress + "/Home/MobileVideo/videoHot"
///  热门产品
public let kUrl_HotProduct = hostAdress + "/Home/MobileHotProduct/Third"
///  底部广告图
public let kUrl_BottomBanner = hostAdress + "/Home/mobileFooterAdvertisement/footer_advertisement_image"
///  热门抢单
public let kUrl_HotQuickRob = hostAdress + "/Home/QuickBill/getHotBill"

///  行业资源
public let kUrl_IndustryResources = hostAdress + "/Home/MobileIndustryResources/index"
///  贷款学院
public let kUrl_LoanCollege = hostAdress + "/Home/MobileLoanCollege/index"
///  推广工具
public let kUrl_PopularizeTool = hostAdress + ""
///  获取用户签到
public let kUrl_GetSignInfo = hostAdress + "/Home/MobileSign/index"
///  用户签到
public let kUrl_UserSignIn = hostAdress + "/Home/MobileSign/point"
///  资讯研读
public let kUrl_InfoStudying = hostAdress + "/Home/MobileInformationStudy/index"
///  视频中心
public let kUrl_VideoCenter = hostAdress + "Home/MobileVideo/videoList"
///  视频详情
public let kUrl_VideoDetail = hostAdress + "/Home/MobileVideo/videoInfo"

//MARK: - 贷款接口
///贷款产品列表
public let kUrl_LoansProductList = hostAdress + "/Home/MobileAllLoanProducts/three"
///贷款产品详情
public let kUrl_LoansProductDetail = hostAdress + "/Home/MobileLoanProducts/detail"
///自营产品信息录入
public let kUrl_SelfSupportInput = hostAdress + "/Home/MobileHotProduct/self_entry_customer_information"
///第三方产品录入
public let kUrl_ThirdSupportInput = hostAdress + "/Home/MobileLoanProducts/Economicman_input_Customer_information"



//MARK: - 消息接口
///消息列表接口
public let kUrl_InfoList = hostAdress + "/Home/MobileMessage/messageList"
///消息详情接口
public let kUrl_InfoDetail = hostAdress + "/Home/MobileMessage/messageInfo"
///删除消息
public let kUrl_removeInfo = hostAdress + "/Home/MobileMessage/messageInvalid"






