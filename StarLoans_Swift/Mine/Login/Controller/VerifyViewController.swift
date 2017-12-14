//
//  VerifyViewController.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/11/25.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit

enum vcType {
    case register
    case forgetPassword
}

private let kBoard = 37.5
private let kHeight = 45

class VerifyViewController: UIViewController {
    
    var vcType : vcType = .register

    //MARK: - 懒加载
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
    
    lazy var verCodeView: LoginInputView = { [unowned self] in
        let verCodeView = LoginInputView()
        self.view.addSubview(verCodeView)
        verCodeView.leftImageView.image = #imageLiteral(resourceName: "ICON-mima")
        verCodeView.selectImage = #imageLiteral(resourceName: "ICON-mima-1")
        verCodeView.textField.placeholder = "请输入验证码"
        verCodeView.textField.keyboardType = .numberPad
        verCodeView.rightImage = .verCode
        return verCodeView
        }()
    
    lazy var nextBtn: UIButton = { [unowned self] in
        let nextBtn = UIButton()
        self.view.addSubview(nextBtn)
        nextBtn.backgroundColor = kMainColor
        nextBtn.setTitle("下一步", for: .normal)
        nextBtn.setTitleColor(UIColor.white, for: .normal)
        nextBtn.layer.cornerRadius = 22.5
        nextBtn.addTarget(self, action: #selector(settingPasswordVc), for: .touchUpInside)
        return nextBtn
        }()
    
    //MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        switch vcType {
        case .register:
            title = "注册"
        case .forgetPassword:
            title = "找回密码"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillLayoutSubviews() {
        //手机号
        phoneView.snp.makeConstraints { (make) in
            make.left.equalTo(kBoard)
            make.right.equalTo(-kBoard)
            make.height.equalTo(kHeight)
            make.top.equalTo(kBoard)
        }
        
        //验证码
        verCodeView.snp.makeConstraints { (make) in
            make.top.equalTo(phoneView.snp.bottom).offset(kBoard/2)
            make.left.equalTo(kBoard)
            make.right.equalTo(-kBoard)
            make.height.equalTo(kHeight)
        }
        
        //下一步
        nextBtn.snp.makeConstraints { (make) in
            make.top.equalTo(verCodeView.snp.bottom).offset(kBoard)
            make.left.equalTo(kBoard)
            make.right.equalTo(-kBoard)
            make.height.equalTo(45)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
    }

}

//MARK: - 数据处理
extension VerifyViewController {
    @objc func settingPasswordVc() {
        
        guard phoneView.textField.text?.lengthOfBytes(using: .utf8) != 0 else {
            JSProgress.showFailStatus(with: "请输入手机号")
            return
        }
        guard verCodeView.textField.text?.lengthOfBytes(using: .utf8) != 0 else {
            JSProgress.showFailStatus(with: "请输入密码")
            return
        }
        
        JSProgress.showBusy()
        
        //FIXME: - 测试用, 以后删除
        let passwordVc = PasswordViewController()
        passwordVc.vcType = vcType
        navigationController?.pushViewController(passwordVc, animated: true)
        ///
        
        LoginViewModel.phoneVerify(with: phoneView.textField.text!, verCode: verCodeView.textField.text!, success: { [weak self] (userModel) in
            
            JSProgress.hidden()
            
            let passwordVc = PasswordViewController()
            passwordVc.vcType = (self?.vcType)!
            self?.navigationController?.pushViewController(passwordVc, animated: true)
            
        }) { (error) in
            
            JSProgress.hidden()
            JSProgress.showFailStatus(with: "验证失败")
            
        }
    }
}
