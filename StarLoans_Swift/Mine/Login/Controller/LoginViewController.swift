//
//  LoginViewController.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/11/7.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit
//import SVProgressHUD

private let kBoard = 37.5
private let kHeight = 45

// MARK: - 界面部分
class LoginViewController: UIViewController {
    
    //MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        title = ""
        view.backgroundColor = .white
        setNavigationBarConfig()
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(callback))
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: registerBtn)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .default
    }
    
    override func viewWillLayoutSubviews() {
        setupUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - 顶部标题
    lazy var topLab: UILabel = { [unowned self] in
        let topLab = UILabel()
        self.view.addSubview(topLab)
        topLab.text = "欢迎您!"
        topLab.font = UIFont.systemFont(ofSize: 30)
        return topLab
        }()
    
    //MARK: - 手机号
    lazy var phoneView: LoginInputView = { [unowned self] in
        let phoneView = LoginInputView()
        self.view.addSubview(phoneView)
        phoneView.leftImageView.image = #imageLiteral(resourceName: "ICON-phone-1")
        phoneView.selectImage = #imageLiteral(resourceName: "ICON-phone")
        phoneView.textField.placeholder = "请输入手机号"
        phoneView.textField.keyboardType = .numberPad
        phoneView.textLength = 11
        return phoneView
    }()
    
    //MARK: - 密码
    lazy var pwdView: LoginInputView = { [unowned self] in
        let pwdView = LoginInputView()
        self.view.addSubview(pwdView)
        pwdView.leftImageView.image = #imageLiteral(resourceName: "ICON-mima")
        pwdView.selectImage = #imageLiteral(resourceName: "ICON-mima-1")
        pwdView.textField.placeholder = "请输入密码"
        pwdView.textField.isSecureTextEntry = true
        return pwdView
    }()
    
    //MARK: - 登录, 注册, 忘记密码
    lazy var loginBtn: UIButton = { [unowned self] in
        let loginBtn = UIButton()
        self.view.addSubview(loginBtn)
        loginBtn.backgroundColor = kMainColor
        loginBtn.setTitle("登录", for: .normal)
        loginBtn.setTitleColor(UIColor.white, for: .normal)
        loginBtn.layer.cornerRadius = 22.5
        loginBtn.addTarget(self, action: #selector(login), for: .touchUpInside)
        return loginBtn
    }()
    
    lazy var forgetBtn: UIButton = { [unowned self] in
        let forgetBtn = UIButton()
        self.view.addSubview(forgetBtn)
        forgetBtn.setTitle("忘记密码?", for: .normal)
        forgetBtn.setTitleColor(kTextColor, for: .normal)
        forgetBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        forgetBtn.addTarget(self, action: #selector(forgetVc), for: .touchUpInside)
        return forgetBtn
    }()
    
    lazy var registerBtn: UIButton = { [unowned self] in
        let registerBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
        registerBtn.setTitle("注册", for: .normal)
        registerBtn.setTitleColor(kMainColor, for: .normal)
        registerBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        registerBtn.addTarget(self, action: #selector(registerVc), for: .touchUpInside)
        return registerBtn
    }()
    
    func setupUI() {
        //顶部标题
        topLab.snp.makeConstraints { (make) in
            make.top.equalTo(kBoard)
            make.left.equalTo(kBoard)
            make.right.equalTo(-kBoard)
            make.height.equalTo(kHeight)
        }
        
        //手机号
        phoneView.snp.makeConstraints { (make) in
            make.top.equalTo(topLab.snp.bottom).offset(kBoard/2)
            make.left.equalTo(kBoard)
            make.right.equalTo(-kBoard)
            make.height.equalTo(kHeight)
        }
        
        //密码
        pwdView.snp.makeConstraints { (make) in
            make.top.equalTo(phoneView.snp.bottom).offset(kBoard/2)
            make.left.equalTo(kBoard)
            make.right.equalTo(-kBoard)
            make.height.equalTo(kHeight)
        }
        
        //忘记密码
        forgetBtn.snp.makeConstraints { (make) in
            make.top.equalTo(pwdView.snp.bottom).offset(kBoard/2)
            make.width.equalTo(80)
            make.right.equalTo(-kBoard)
            make.height.equalTo(kHeight)
        }
        
        //登录
        loginBtn.snp.makeConstraints { (make) in
            make.top.equalTo(forgetBtn.snp.bottom).offset(kBoard/2)
            make.left.equalTo(kBoard)
            make.right.equalTo(-kBoard)
            make.height.equalTo(45)
        }

    }
}

//MARK: - 数据处理部分
extension LoginViewController {
    
    @objc func login() {
        
        guard phoneView.textField.text?.lengthOfBytes(using: .utf8) != 0 else {
            JSProgress.showFailStatus(with: "请输入手机号")
            return
        }
        guard pwdView.textField.text?.lengthOfBytes(using: .utf8) != 0 else {
            JSProgress.showFailStatus(with: "请输入密码")
            return
        }
        
        JSProgress.showBusy()
        
        //登录逻辑
        LoginViewModel.login(with: phoneView.textField.text!, password: pwdView.textField.text!, success: { [weak self] (userModel) in
            
            JSProgress.hidden()
            
            if userModel.resultnumber == 200 {
                self?.navigationController?.dismiss(animated: true, completion: nil)
            }
            
        }) { (error) in
            
            JSProgress.hidden()
            JSProgress.showFailStatus(with: "登录失败")
        }
    }
    
    @objc func callback() {
        navigationController?.dismiss(animated: true, completion: {
        })
    }
    
    @objc func forgetVc() {
        let forgetVc = VerifyViewController()
        forgetVc.vcType = .forgetPassword
        navigationController?.pushViewController(forgetVc, animated: true)
    }
    
    @objc func registerVc() {
        let registerVc = VerifyViewController()
        registerVc.vcType = .register
        navigationController?.pushViewController(registerVc, animated: true)
    }
}
