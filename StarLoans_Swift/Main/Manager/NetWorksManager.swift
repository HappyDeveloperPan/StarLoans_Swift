//
//  NetWorksManager.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/11/27.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit
import Alamofire

class NetWorksManager: NSObject {
    
    /// 数据请求
    ///
    /// - Parameters:
    ///   - url: 请求地址
    ///   - type: 请求类型
    ///   - parameters: 请求参数
    ///   - success: 成功回调
    ///   - failture: 失败回调
    class func requst(with url: String, type: HTTPMethod, parameters: Dictionary<String , Any>, success: @escaping (_ response : Any) -> (), failture: @escaping (_ error: Error)->()) {
        
        let headers: HTTPHeaders = ["Accept": "application/json"]
//                                    "Accept": "text/javascript",
//                                    "Accept": "text/html",
//                                    "Accept": "text/plain"]
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 15
        
        print("url:\n\(url)")
        print("parameters:\n\(parameters)")

        manager.request(url, method: type, parameters: parameters, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
            
            print("response: \n\(String(describing: response.result.value as? [String: AnyObject]))")
            
            switch response.result {
            case .success(let value):
                //当响应成功是，使用临时变量value接受服务器返回的信息并判断是否为[String: AnyObject]类型 如果是那么将其传给其定义方法中的success
//                if let value = response.result.value as? [String: AnyObject] {
                success(value)
//                }
            case .failure(let error):
                print("error:\(error)")
                failture(error)
            }
        }
        
    }
    
    /// 上传图片(注意: 图片必须为Data||NSData类型, 其他参数尽量传String||NSString)
    ///
    /// - Parameters:
    ///   - url: 请求地址
    ///   - parameters: 传送参数
    ///   - success: 成功回调
    ///   - failture: 失败回调
    class func uploadImages(with url: String, parameters: Dictionary<String , Any>, success: @escaping (_ response : [String : AnyObject]?) -> (), failture: @escaping (_ error: Error)->()) {
        
        let headers: HTTPHeaders = ["Accept": "application/json"]
//                                    "Accept": "text/javascript",
//                                    "Accept": "text/html",
//                                    "Accept": "text/plain"]
        
        let manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 15
        
        print("url:\n\(url)")
        
        manager.upload(multipartFormData: { (multipartFormData) in
            for (key, value) in parameters {
                if value is Data || value is NSData {
                    let imageName = String(describing: NSData()).appending(".png")
                    multipartFormData.append(value as! Data, withName: key , fileName: imageName, mimeType: "image/png")
                }else {
                    
                    print("parameters:\n\(key, value)")
                    
                    let str: String = value as! String
                    multipartFormData.append(str.data(using: .utf8)!, withName: key )
                }
            }
        }, usingThreshold: SessionManager.multipartFormDataEncodingMemoryThreshold, to: url, method: .post, headers: headers) { (encodingResult) in
            switch encodingResult {
            case .success(request: let request, streamingFromDisk: _, streamFileURL: _):
                request.responseJSON(completionHandler: { (response) in
                    
                    print("response: \n\(String(describing: response.result.value as? [String: AnyObject]))")
                    
                    if let myJson = response.result.value {
                        success(myJson as? [String : AnyObject])
                        if (myJson as! NSObject) as! Decimal == 0 {
                            print("上传成功")
                        }else {
                            print("上传失败")
                        }
                    }
                })
            case .failure(let error):
                print("error:\(error)")
                failture(error)
                
            }
        }
    }
}

















