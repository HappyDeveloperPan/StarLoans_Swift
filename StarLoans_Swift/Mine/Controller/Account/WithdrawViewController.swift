//
//  WithdrawViewController.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/12/18.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit

class WithdrawViewController: UIViewController, StoryboardLoadable {
    //  银行卡相关
    @IBOutlet weak var addBankCardLB: UILabel!
    @IBOutlet weak var bankCardImg: UIImageView!
    @IBOutlet weak var bankNameLB: UILabel!
    @IBOutlet weak var cardNameLB: UILabel!
    
    @IBOutlet weak var commitBtn: UIButton!
    @IBOutlet weak var allMoneyLB: UILabel!
    @IBOutlet weak var moneyTF: UITextField!
    
    //MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "提现"
        setupUI()
    }
    
    func setupUI() {
        commitBtn.layer.cornerRadius = commitBtn.height/2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Method
    ///选择银行卡
    @IBAction func changeBtnClick(_ sender: UIButton) {
        print("选择银行卡")
    }
    ///所有金额
    @IBAction func allMoneyBtn(_ sender: UIButton) {
        
    }
    ///确认提现
    @IBAction func commitBtnClick(_ sender: UIButton) {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
