//
//  ResetViewController.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2018/1/3.
//  Copyright © 2018年 iOS Pan. All rights reserved.
//

import UIKit

enum ResetType {
    case newPhoneNum                //新手机号
    case verCode                    //验证码
    case transactionPass            //交易密码
    case confirmTransactionPass     //确认交易密码
    case oldLoginPass               //原密码
    case newLoginPass               //新密码
    case confirmNewLoginPass        //确认新密码
}

class ResetViewController: BaseViewController, StoryboardLoadable{
    @IBOutlet weak var titleLB: UILabel!
    @IBOutlet weak var importView: LoginInputView!
    @IBOutlet weak var explainLB: UILabel!
    @IBOutlet weak var nextBtn: UIButton!
    
    var resetType:ResetType = .newPhoneNum
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBasic()
    }
    
    func setupBasic() {
        switch resetType {
        case .newPhoneNum:
            title = "输入新手机号"
            titleLB.text = "输入新手机号"
            importView.leftImageView.image = #imageLiteral(resourceName: "ICON-phone-1")
            importView.selectImage = #imageLiteral(resourceName: "ICON-phone")
            importView.textField.placeholder = "请输入手机号"
            importView.textField.keyboardType = .numberPad
            importView.textLength = 11
        case .verCode:
            title = "输入验证码"
            titleLB.text = "输入验证码"
            importView.leftImageView.image = #imageLiteral(resourceName: "ICON-mima")
            importView.selectImage = #imageLiteral(resourceName: "ICON-mima-1")
            importView.textField.placeholder = "请输入验证码"
            importView.textField.keyboardType = .numberPad
            importView.rightImage = .none
            nextBtn.setTitle("提交", for: .normal)
        case .transactionPass:
            title = "输入交易密码"
            titleLB.text = "输入交易密码"
            importView.leftImageView.image = #imageLiteral(resourceName: "ICON-mima")
            importView.selectImage = #imageLiteral(resourceName: "ICON-mima-1")
            importView.textField.placeholder = "请输入密码"
            importView.textField.isSecureTextEntry = true
            importView.rightImage = .eye
        case .confirmTransactionPass:
            title = "确认交易密码"
            titleLB.text = "确认交易密码"
            importView.leftImageView.image = #imageLiteral(resourceName: "ICON-mima")
            importView.selectImage = #imageLiteral(resourceName: "ICON-mima-1")
            importView.textField.placeholder = "请输入密码"
            importView.textField.isSecureTextEntry = true
            importView.rightImage = .eye
            nextBtn.setTitle("提交", for: .normal)
        case .oldLoginPass:
            title = "输入原登录密码"
            titleLB.text = "输入原登录密码"
            importView.leftImageView.image = #imageLiteral(resourceName: "ICON-mima")
            importView.selectImage = #imageLiteral(resourceName: "ICON-mima-1")
            importView.textField.placeholder = "请输入密码"
            importView.textField.isSecureTextEntry = true
            importView.rightImage = .eye
        case .newLoginPass:
            title = "设置新密码"
            titleLB.text = "设置新密码"
            importView.leftImageView.image = #imageLiteral(resourceName: "ICON-mima")
            importView.selectImage = #imageLiteral(resourceName: "ICON-mima-1")
            importView.textField.placeholder = "请输入密码"
            importView.textField.isSecureTextEntry = true
            importView.rightImage = .eye
        case .confirmNewLoginPass:
            title = "确认新密码"
            titleLB.text = "确认新密码"
            importView.leftImageView.image = #imageLiteral(resourceName: "ICON-mima")
            importView.selectImage = #imageLiteral(resourceName: "ICON-mima-1")
            importView.textField.placeholder = "请输入密码"
            importView.textField.isSecureTextEntry = true
            importView.rightImage = .eye
            nextBtn.setTitle("提交", for: .normal)
        }
        nextBtn.layer.cornerRadius = nextBtn.height/2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func nextBtnClick(_ sender: UIButton) {
        switch resetType {
        case .newPhoneNum:
            let vc = ResetViewController.loadStoryboard()
            vc.resetType = .verCode
            navigationController?.pushViewController(vc, animated: true)
        case .verCode:
            JSProgress.showSucessStatus(with: "修改成功")
            //跳转回设置界面并且刷新
            for controller: UIViewController in (navigationController?.viewControllers)! {
                if (controller is SettingViewController) {
                    let revise = controller as? SettingViewController
                    navigationController?.popToViewController(revise ?? UIViewController(), animated: true)
                }
            }
        case .transactionPass:
            let vc = ResetViewController.loadStoryboard()
            vc.resetType = .confirmTransactionPass
            navigationController?.pushViewController(vc, animated: true)
        case .confirmTransactionPass:
            JSProgress.showSucessStatus(with: "修改成功")
            //跳转回设置界面并且刷新
            for controller: UIViewController in (navigationController?.viewControllers)! {
                if (controller is SettingViewController) {
                    let revise = controller as? SettingViewController
                    navigationController?.popToViewController(revise ?? UIViewController(), animated: true)
                }
            }
        case .oldLoginPass:
            let vc = ResetViewController.loadStoryboard()
            vc.resetType = .newLoginPass
            navigationController?.pushViewController(vc, animated: true)
        case .newLoginPass:
            let vc = ResetViewController.loadStoryboard()
            vc.resetType = .confirmNewLoginPass
            navigationController?.pushViewController(vc, animated: true)
        case .confirmNewLoginPass:
            JSProgress.showSucessStatus(with: "修改成功")
            //跳转回设置界面并且刷新
            for controller: UIViewController in (navigationController?.viewControllers)! {
                if (controller is SettingViewController) {
                    let revise = controller as? SettingViewController
                    navigationController?.popToViewController(revise ?? UIViewController(), animated: true)
                }
            }
        }
    }
    
}
