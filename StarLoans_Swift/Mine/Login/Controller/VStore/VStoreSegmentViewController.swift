//
//  VStoreSegmentViewController.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2018/1/6.
//  Copyright © 2018年 iOS Pan. All rights reserved.
//

import UIKit

fileprivate let titleArr: [String] = ["全部", "待受理", "待反馈", "待审批", "待抵押", "未通过", "已完成"]

class VStoreSegmentViewController: SegmentViewController {
    //MARK: - 懒加载
    lazy var segmentView: SelectScrollview = { [unowned self] in
        let segmentView = SelectScrollview()
        segmentView.arrTitle = ["全部", "待受理", "待反馈", "待审批", "待抵押", "未通过", "已完成"]
        var arr:[UIViewController] = []
        for index in 0..<segmentView.arrTitle!.count {
            let vc = VStoreListViewController()
            arr.append(vc)
        }
        segmentView.viewControllers = arr
        self.view.addSubview(segmentView)
        return segmentView
        }()
    
    //MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "微店订单"
//        segmentView.createUI()
        selectedSegmentIndex = 1
        for i in 0...titleArr.count-1 {
            let vc = VStoreListViewController()
            vc.title = titleArr[i]
//            vc.view.backgroundColor = UIColor.RGB(with: CGFloat(arc4random()/255), green: CGFloat(arc4random()/255), blue: CGFloat(arc4random()/255))
//            vc.collectionView.backgroundColor = UIColor.RGB(with: CGFloat(arc4random()/255), green: CGFloat(arc4random()/255), blue: CGFloat(arc4random()/255))
            addChildViewController(vc)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        isNavLineHidden = false
    }
    
    override func viewWillLayoutSubviews() {
        super .viewWillLayoutSubviews()
//        segmentView.snp.makeConstraints { (make) in
//            make.edges.equalToSuperview()
//        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super .viewWillDisappear(animated)
        isNavLineHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
