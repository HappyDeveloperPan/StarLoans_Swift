//
//  LoansMoreProblemViewController.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/12/28.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit

class LoansMoreProblemViewController: BaseViewController {

    //MARK: - 懒加载
    lazy var questionBtn: UIButton = { [unowned self] in
        let questionBtn = UIButton()
        self.view.addSubview(questionBtn)
        questionBtn.setTitle("我要提问", for: .normal)
        questionBtn.setTitleColor(UIColor.white, for: .normal)
        questionBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        questionBtn.backgroundColor = kMainColor
        questionBtn.addTarget(self, action: #selector(questionBtnClick(_:)), for: .touchUpInside)
        return questionBtn
    }()
    
    lazy var tableView: UITableView = { [unowned self] in
        let tableView = UITableView()
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.pan_registerCell(cell: ProblemCell.self)
        tableView.estimatedRowHeight = 160
        tableView.rowHeight = UITableViewAutomaticDimension
        return tableView
    }()
    //MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "更多问题"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        isNavLineHidden = false
    }
    
    override func viewWillLayoutSubviews() {
        super .viewWillLayoutSubviews()
        questionBtn.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.height.equalTo(49)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.left.top.right.equalToSuperview()
            make.bottom.equalTo(questionBtn.snp.top)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super .viewWillDisappear(animated)
        isNavLineHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @objc func questionBtnClick(_ sender: UIButton) {
        let vc = LoansQuestionsViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - UITableView代理
extension LoansMoreProblemViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.pan_dequeueReusableCell(indexPath: indexPath) as ProblemCell
        return cell
    }
}
