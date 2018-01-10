//
//  VStoreViewController.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2018/1/4.
//  Copyright © 2018年 iOS Pan. All rights reserved.
//

import UIKit

fileprivate let managerFuncArr: [String] = ["待受理", "待反馈", "待审批", "待放款", "未通过", "已完成"]
fileprivate let brokerFuncArr: [String] = ["已代理客户", "已发产品", "收到订单", "已购资源", "已发资源", "已完成"]

enum VStoreType {
    case manager
    case broker
}

class VStoreViewController: BaseViewController, StoryboardLoadable {
    @IBOutlet weak var headIMg: UIImageView!
    @IBOutlet weak var userNameLB: UILabel!
    @IBOutlet weak var userTypeLB: UILabel!
    @IBOutlet weak var makeMoneyLB: UILabel!
    @IBOutlet weak var loanLB: UILabel!
    @IBOutlet weak var funcView: UIView!
    //MARK: - 可操作数据
    var storeType: VStoreType = .broker
    //MARK: - 懒加载
    lazy var layout: UICollectionViewFlowLayout = { [unowned self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kScreenWidth/3 , height: 86)
        layout.minimumLineSpacing = -0.5
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.scrollDirection = .vertical
        return layout
        }()
    
    lazy var collectionView: UICollectionView = { [unowned self] in
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        self.funcView.addSubview(collectionView)
        if #available(iOS 11.0, *) {
            collectionView.contentInsetAdjustmentBehavior = .never
        }
        collectionView.backgroundColor = UIColor.white
        collectionView.pan_registerCell(cell: VStoreFuncCollectionViewCell.self)
        collectionView.isScrollEnabled = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
        }()
    
    //MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "微店订单"
        setupBasic()
    }
    
    func setupBasic() {
        userTypeLB.layer.backgroundColor = kMainColor.cgColor
        userTypeLB.layer.cornerRadius = userTypeLB.height/2
    }

    override func viewWillLayoutSubviews() {
        super .viewWillLayoutSubviews()
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        collectionView.layoutIfNeeded()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func moreBtnClick(_ sender: UIButton) {
        let vc = VStoreSegmentViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - UICollectionView代理
extension VStoreViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.pan_dequeueReusableCell(indexPath: indexPath) as VStoreFuncCollectionViewCell
        if storeType == .broker {
            cell.titleLB.text = brokerFuncArr[indexPath.row]
        }
        if storeType == .manager {
            cell.titleLB.text = managerFuncArr[indexPath.row]
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = VStoreSegmentViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

