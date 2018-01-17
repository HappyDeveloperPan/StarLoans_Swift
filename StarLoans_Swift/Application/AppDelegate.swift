//
//  AppDelegate.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/11/7.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit
import SwiftyJSON

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var allowRotation: Bool = false

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        ///     第三方注册
        WXApi.registerApp(WXAppID, enableMTA: true)
        
        ///     自动登录
        if let userDic = Utils.getAsynchronousWithKey(kSavedUser) as? Dictionary<String, Any>{
            
            UserManager.shareManager.userModel = UserModel(with: JSON(userDic))
            
            let parameters = ["token": UserManager.shareManager.userModel.token] as [String : AnyObject]
            
            NetWorksManager.requst(with: kUrl_AutoLogin, type: .post, parameters: parameters, completionHandler: { (jsonData, error) in
                if jsonData?["status"] == 200 {
                    UserManager.shareManager.isLogin = true
                    UserManager.shareManager.userModel = UserModel(with: jsonData!["data"])
                    NotificationCenter.default.post(name: NSNotification.Name(rawValue: kReloadUserData), object: nil)
                }else {
                    if error == nil {
                        if let msg = jsonData?["msg_zhcn"].stringValue {
                            JSProgress.showFailStatus(with: msg)
                        }
                    }else {
                        JSProgress.showFailStatus(with: "请求失败")
                    }
                }
            })
        }
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        window?.rootViewController = AXDTabBarViewController()
        window?.makeKeyAndVisible()
        setupGlobalConfig()
        
        return true

    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        print("openURL:\(url.absoluteString)")
        if url.scheme == WXAppID {
            return WXApi.handleOpen(url, delegate: self)
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        if allowRotation{
            return [UIInterfaceOrientationMask.landscapeLeft, UIInterfaceOrientationMask.landscapeRight, UIInterfaceOrientationMask.portrait]
        }
        return UIInterfaceOrientationMask.portrait
    }

}

//MARK: - WXApiDelegate代理
extension AppDelegate: WXApiDelegate {
    ///微信支付回调结果
    func onResp(_ resp: BaseResp!) {
        if resp .isKind(of: PayResp.self) {
            switch resp.errCode {
            case WXErrCodeUnsupport.rawValue...WXSuccess.rawValue:            /*支付成功*/
                ///支付成功需要回调服务器
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: kWechatPayResult), object: resp.errCode)
//            case WXErrCodeCommon.rawValue:      /*普通错误类型*/
//                break
//            case WXErrCodeUserCancel.rawValue:  /*用户点击取消*/
//                break
//            case WXErrCodeSentFail.rawValue:    /*发送失败*/
//                break
//            case WXErrCodeAuthDeny.rawValue:    /*授权失败*/
//                break
//            case WXErrCodeUnsupport.rawValue:   /*微信不支持*/
//                break
            default: break
            }
        }
    }
}


