//
//  LoansQuestionsViewController.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/12/28.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit

class LoansQuestionsViewController: BaseViewController {
    
    lazy var textView: MyTextView = { [unowned self] in
        let textView = MyTextView()
        self.view.addSubview(textView)
        textView.placeholder = "请输入问题（200字以内）"
        textView.backgroundColor = kHomeBackColor
        textView.placeHolderLabel?.font = UIFont.systemFont(ofSize: 14)
        return textView
    }()
    
    lazy var commitBtn: UIButton = { [unowned self] in
        let commitBtn = UIButton()
        self.view.addSubview(commitBtn)
        commitBtn.setTitle("提交", for: .normal)
        commitBtn.setTitleColor(UIColor.white, for: .normal)
        commitBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        commitBtn.backgroundColor = kMainColor
        commitBtn.layer.cornerRadius = 22.5
        commitBtn.addTarget(self, action: #selector(commitBtnClick(_:)), for: .touchUpInside)
        return commitBtn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "提问"
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        isNavLineHidden = false
    }
    
    override func viewWillLayoutSubviews() {
        super .viewWillLayoutSubviews()
        
        textView.snp.makeConstraints { (make) in
            make.top.equalTo(10)
            make.left.right.equalTo(16)
            make.height.equalTo(200)
        }
        
        commitBtn.snp.makeConstraints { (make) in
            make.top.equalTo(textView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: 300, height: 45))
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super .viewWillDisappear(animated)
        isNavLineHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func commitBtnClick(_ sender: UIButton) {
        ///等下写提交接口
        navigationController?.popViewController(animated: true)
    }
    
}
