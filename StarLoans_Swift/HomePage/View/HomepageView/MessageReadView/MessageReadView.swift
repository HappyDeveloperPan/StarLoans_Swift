//
//  MessageReadView.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/12/7.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit

fileprivate let messageReadCellID: String = "MessageTableViewCell"

class MessageReadView: UIView {
    
    //MARK: - 懒加载
    lazy var topMoreBtn: UIButton = { [unowned self] in
        let topMoreBtn = UIButton()
        addSubview(topMoreBtn)
        topMoreBtn.setTitle("资讯研读>", for: .normal)
        topMoreBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        topMoreBtn.setTitleColor(UIColor.RGB(with: 51, green: 51, blue: 51), for: .normal)
        topMoreBtn.setImage(#imageLiteral(resourceName: "ICON-hot"), for: .normal)
        topMoreBtn.addTarget(self, action: #selector(topMoreBtnClick(_:)), for: .touchUpInside)
        return topMoreBtn
        }()
    
    lazy var centerLine: UIView = { [unowned self] in
        let centerLine = UIView()
        addSubview(centerLine)
        centerLine.backgroundColor = UIColor.RGB(with: 200, green: 200, blue: 200)
        return centerLine
        }()
    
    lazy var tableView: UITableView = { [unowned self] in
        let tableView = UITableView()
        addSubview(tableView)
        tableView.backgroundColor = kHomeBackColor
        tableView.register(UINib(nibName: messageReadCellID, bundle: nil), forCellReuseIdentifier: messageReadCellID)
        tableView.isScrollEnabled = false
//        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
        }()

    //MARK: - 生命周期
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super .layoutSubviews()
        topMoreBtn.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.size.equalTo(CGSize(width: kScreenWidth, height: 40))
        }
        
        centerLine.snp.makeConstraints { (make) in
            make.top.equalTo(topMoreBtn.snp.bottom)
            make.left.right.equalToSuperview()
            make.size.equalTo(CGSize(width: kScreenWidth, height: 0.5))
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(centerLine.snp.bottom)
            make.left.right.equalToSuperview()
            make.size.equalTo(CGSize(width: kScreenWidth, height: 312))
        }
        
    }
    
    @objc func topMoreBtnClick(_ sender: UIButton) {
        print("更多资讯研读")
    }
}

extension MessageReadView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 104
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: messageReadCellID, for: indexPath) as! MessageTableViewCell
        return cell
    }
}

