//
//  BindingCardNextTableViewController.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/12/19.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit

class BindingCardNextTableViewController: UITableViewController {

    //MARK: - Storyboard连线
    @IBOutlet weak var commitBtn: UIButton!
    @IBOutlet weak var verCodeBtn: VerCodeButton!
    @IBOutlet weak var verCodeTF: UITextField!
    
    //MARK: - 外部属性
    var userName: String = ""
    var bankCardNumber: String = ""
    var phoneNumber: String = ""
    
    //MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }
        commitBtn.layer.cornerRadius = commitBtn.height/2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Method

    @IBAction func commitBtnClick(_ sender: UIButton) {
        guard !((verCodeTF.text?.isEmpty)!) else {
            JSProgress.showFailStatus(with: "请填写验证码")
            return
        }
        
        //跳转回银行卡界面并且刷新
        for controller: UIViewController in (navigationController?.viewControllers)! {
            if (controller is BankCardViewController) {
                let revise = controller as? BankCardViewController
                navigationController?.popToViewController(revise ?? UIViewController(), animated: true)
            }
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

}

extension BindingCardNextTableViewController {
    ///提交数据
    func commitCardbankData() {
        var parameters = [String: Any]()
        parameters["token"] = UserManager.shareManager.userModel.token
        NetWorksManager.requst(with: kUrl_BankCardAdd, type: .post, parameters: parameters) { [weak self] (jsonData, error) in
            if jsonData?["status"] == 200 {
                //跳转回银行卡界面并且刷新
                for controller: UIViewController in (self?.navigationController?.viewControllers)! {
                    if (controller is BankCardViewController) {
                        let revise = controller as? BankCardViewController
                        self?.navigationController?.popToViewController(revise ?? UIViewController(), animated: true)
                    }
                }
            }else {
                if error == nil {
                    if let msg = jsonData?["msg_zhcn"].stringValue {
                        JSProgress.showFailStatus(with: msg)
                    }
                }else {
                    JSProgress.showFailStatus(with: "请求失败")
                }
            }
        }
    }
}
