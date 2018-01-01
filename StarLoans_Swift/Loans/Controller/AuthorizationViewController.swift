//
//  AuthorizationViewController.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/12/28.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit

class AuthorizationViewController: BaseViewController, StoryboardLoadable {
    @IBOutlet weak var leftLine: UIImageView!
    @IBOutlet weak var rightLine: UIImageView!
    @IBOutlet weak var privacyContentLB: UILabel!
    @IBOutlet weak var commitBtn: UIButton!
    @IBOutlet weak var hintContentLB: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "授权确认"
        view.backgroundColor = kHomeBackColor
        setupBasic()
    }
    
    func setupBasic() {
        leftLine.drawImaginaryLine(with: UIColor.RGB(with: 210, green: 210, blue: 210))
        rightLine.drawImaginaryLine(with: UIColor.RGB(with: 210, green: 210, blue: 210))
        
        privacyContentLB.sizeToFit()
        privacyContentLB.numberOfLines = 0
        privacyContentLB.text = "为了确保客户的切身利益，我们将向客户发送一条短信，告知用户您正在为其办理贷款业务；请准确录入客户信息，以便系统核对。"
        
        commitBtn.layer.cornerRadius = commitBtn.height/2
        
        hintContentLB.sizeToFit()
        hintContentLB.numberOfLines = 0
        hintContentLB.text = "温馨提示：为了让有需求的经纪人能更精准的匹配，请您录入真实的客户信息，在未产生交易前，我们不会对经纪人开放客户隐私信息，同时我们将对客户信息全方位保密。"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        isNavLineHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super .viewWillDisappear(animated)
        isNavLineHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func commitBtnClick(_ sender: UIButton) {
        //跳转到录入信息界面
        let vc = InputUserInfoViewController.loadStoryboard()
        vc.title = "客户信息录入"
        navigationController?.pushViewController(vc, animated: true)
    }
}
