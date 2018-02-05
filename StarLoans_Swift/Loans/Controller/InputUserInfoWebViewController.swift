//
//  InputUserInfoWebViewController.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2018/1/26.
//  Copyright © 2018年 iOS Pan. All rights reserved.
//

import UIKit
import WebKit

class InputUserInfoWebViewController: BaseViewController {
    
    //MARK: - 对外属性
    var productId: Int = 0
    var loansProductType: LoansProductType = .selfSupport //产品类别
    var loanClientType: LoanClientType = .personage //用户类别
    var url: String = ""
    
    //MARK: - 内部属性
    ///nav栏
    weak var navController: UINavigationController?
    
    //MARK: - 懒加载
    fileprivate lazy var webView: WKWebView = { [unowned self] in
        //准备工作,初始化 webview 的设置
        let config = WKWebViewConfiguration()
        let userContentController = WKUserContentController()
        //注册监听JS的消息发送
        userContentController.add(self, name: "startParams")
        userContentController.add(self, name: "backVC")
        config.userContentController = userContentController
        
        let webView = WKWebView(frame: .zero, configuration: config)
        self.view.addSubview(webView)
        if #available(iOS 11.0, *) {
            webView.scrollView.contentInsetAdjustmentBehavior = .never
        }
        webView.uiDelegate = self
        webView.navigationDelegate = self
        return webView
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
//        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(sendDataToJs))
        if url.judgeURL() {
            webView.load(URLRequest(url: URL(string: url)!))
        }
        perform(#selector(yanchi), with: nil, afterDelay: 3)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        isNavLineHidden = false
//        navigationController?.delegate = self
//        navController = navigationController
    }
    
    override func viewWillLayoutSubviews() {
        super .viewWillLayoutSubviews()
        webView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super .viewWillDisappear(animated)
        isNavLineHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @objc func yanchi() {
        title = "客户资料"
    }
}

//MARK: - 数据处理
extension InputUserInfoWebViewController {
    ///H5调用接口需要数据
    @objc func sendDataToJs() {
        var parameters = [String: Any]()
        parameters["token"] = UserManager.shareManager.userModel.token
        parameters["pid"] = productId
        parameters["location"] = UserManager.shareManager.userModel.location
        let baseStr = "sendValueStrToJS(\(parameters))"
        webView.evaluateJavaScript(baseStr, completionHandler: nil)
    }
}

//MARK: - WKWebView代理
extension InputUserInfoWebViewController: WKUIDelegate, WKNavigationDelegate, WKScriptMessageHandler {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        
    }
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print(message.name)
        if message.name == "startParams" {
            sendDataToJs()
        }
        if message.name == "backVC" {
            navigationController?.popViewController(animated: true)
        }
    }
}

//MARK: - UINavigationController代理
extension InputUserInfoWebViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if viewController == self {
            navController?.setNavigationBarHidden(true, animated: animated)
        }
        else {
            //不在本页时，显示真正的nav bar
            navController?.setNavigationBarHidden(false, animated: animated)
            //当不显示本页时，要么就push到下一页，要么就被pop了，那么就将delegate设置为nil，防止出现BAD ACCESS
            //之前将这段代码放在viewDidDisappear和dealloc中，这两种情况可能已经被pop了，self.navigationController为nil，这里采用手动持有navigationController的引用来解决
            if navController?.delegate === self  {
                //如果delegate是自己才设置为nil，因为viewWillAppear调用的比此方法较早，其他controller如果设置了delegate就可能会被误伤
                navController?.delegate = nil
            }
        }
    }
}
