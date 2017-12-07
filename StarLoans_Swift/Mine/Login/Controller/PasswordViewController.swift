//
//  PasswordViewController.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/11/25.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit

private let kBoard = 37.5
private let kHeight = 45
private let kProtocolwidth = 256

class PasswordViewController: UIViewController {
    
    var vcType : vcType = .register
    
    //MARK: - 懒加载
    lazy var topLab: UILabel = { [unowned self] in
        let topLab = UILabel()
        self.view.addSubview(topLab)
        topLab.font = UIFont.systemFont(ofSize: 30)
        return topLab
    }()
    
    //MARK: - 密码
    lazy var pwdView: LoginInputView = { [unowned self] in
        let pwdView = LoginInputView()
        self.view.addSubview(pwdView)
        pwdView.leftImageView.image = #imageLiteral(resourceName: "ICON-mima")
        pwdView.selectImage = #imageLiteral(resourceName: "ICON-mima-1")
        pwdView.textField.placeholder = "请输入密码"
        pwdView.textField.isSecureTextEntry = true
        pwdView.rightImage = .eye
        return pwdView
        }()
    
    lazy var submitBtn: UIButton = { [unowned self] in
        let submitBtn = UIButton()
        self.view.addSubview(submitBtn)
        submitBtn.backgroundColor = kMainColor
        submitBtn.setTitle("提交", for: .normal)
        submitBtn.setTitleColor(UIColor.white, for: .normal)
        submitBtn.layer.cornerRadius = 22.5
        submitBtn.addTarget(self, action: #selector(submitBtnClick), for: .touchUpInside)
        return submitBtn
        }()
    
    //MARK: - 用户协议
    lazy var protocolView: UIView = { [unowned self] in
        let protocolView = UIView()
        self.view.addSubview(protocolView)
        return protocolView
    }()
    
    lazy var protocolLab: UILabel = { [unowned self] in
        let protocolLab = UILabel()
        self.protocolView.addSubview(protocolLab)
        protocolLab.text = "注册即表示您已阅读, 并同意"
        protocolLab.textColor = kTextColor
        protocolLab.font = UIFont.systemFont(ofSize: 12)
        return protocolLab
    }()
    
    lazy var protocolBtn: UIButton = { [unowned self] in
        let protocolBtn = UIButton()
        self.protocolView.addSubview(protocolBtn)
        protocolBtn.setTitle("《用户注册协议》", for: .normal)
        protocolBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        protocolBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        protocolBtn.setTitleColor(UIColor(red: 0/255, green: 120/255, blue: 215/255, alpha: 1), for: .normal)
        protocolBtn.addTarget(self, action: #selector(userProtocol), for: .touchUpInside)
        return protocolBtn
    }()
    
    //MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        switch vcType {
        case .register:
            title = "注册"
            topLab.text = "设置登录密码"
            submitBtn.setTitle("立即注册", for: .normal)
        case .forgetPassword:
            title = "找回密码"
            topLab.text = "设置新密码"
            submitBtn.setTitle("提交", for: .normal)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillLayoutSubviews() {
        topLab.snp.makeConstraints { (make) in
            make.top.equalTo(kBoard)
            make.left.equalTo(kBoard)
            make.right.equalTo(-kBoard)
            make.height.equalTo(kHeight)
        }
        
        pwdView.snp.makeConstraints { (make) in
            make.top.equalTo(topLab.snp.bottom).offset(kBoard/2)
            make.left.equalTo(kBoard)
            make.right.equalTo(-kBoard)
            make.height.equalTo(kHeight)
        }
        
        submitBtn.snp.makeConstraints { (make) in
            make.top.equalTo(pwdView.snp.bottom).offset(kBoard * 2)
            make.left.equalTo(kBoard)
            make.right.equalTo(-kBoard)
            make.height.equalTo(kHeight)
        }
        
        if vcType == .register {
            protocolView.snp.makeConstraints({ (make) in
                make.centerX.equalToSuperview()
                make.top.equalTo(pwdView.snp.bottom).offset(kBoard)
                make.height.equalTo(12)
                make.width.equalTo(kProtocolwidth)
            })
            
            protocolLab.snp.makeConstraints({ (make) in
                make.left.centerY.equalToSuperview()
                make.size.equalTo(CGSize(width: 156, height: 12))
            })
            
            protocolBtn.snp.makeConstraints({ (make) in
                make.left.equalTo(protocolLab.snp.right)
                make.centerY.equalToSuperview()
                make.size.equalTo(CGSize(width: 100, height: 12))
            })
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
    }
    
    @objc func userProtocol() {
        print("我被点击了")
    }
    
    @objc func submitBtnClick() {
        navigationController?.dismiss(animated: true, completion: nil)
    }

}

extension PasswordViewController {
    
}
