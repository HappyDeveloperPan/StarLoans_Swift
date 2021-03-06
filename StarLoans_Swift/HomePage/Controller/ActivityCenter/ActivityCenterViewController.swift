//
//  ActivityCenterViewController.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2018/1/21.
//  Copyright © 2018年 iOS Pan. All rights reserved.
//

import UIKit
import WebKit

class ActivityCenterViewController: BaseViewController {
    
    //MARK: - 对外属性
    var url: String = ""

    //MARK: - 内部属性
    fileprivate lazy var webView: WKWebView = { [unowned self] in
        let webView = WKWebView()
        self.view.addSubview(webView)
        webView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        return webView
    }()
    
    fileprivate lazy var progressView: UIProgressView = { [unowned self] in
        let progressView = UIProgressView()
        progressView.progressTintColor = kMainColor
        progressView.trackTintColor = UIColor.white
//        self.navigationController?.navigationBar.addSubview(progressView)
        self.view.addSubview(progressView)
        return progressView
    }()
    
    //MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        if url.judgeURL() {
            webView.load(URLRequest(url: URL(string: url)!))
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        isNavLineHidden = false
    }
    
    override func viewWillLayoutSubviews() {
        super .viewWillLayoutSubviews()
        progressView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(2)
        }
        
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
    
    deinit {
        webView.removeObserver(self, forKeyPath: "estimatedProgress")
        progressView.reloadInputViews()
        progressView.removeFromSuperview()
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            progressView.isHidden = webView.estimatedProgress == 1
            progressView.setProgress(Float(webView.estimatedProgress), animated: true)
        }
    }

}

//MARK: - 数据处理
extension ActivityCenterViewController {
    func backItemPressed() {
        if webView.canGoBack {
            webView.goBack()
        }else {
            navigationController?.popViewController(animated: true)
        }
    }
}

//MARK: - WKWebView代理
extension ActivityCenterViewController: WKUIDelegate, WKNavigationDelegate, UINavigationControllerDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        progressView.setProgress(0.0, animated: false)
    }
}
