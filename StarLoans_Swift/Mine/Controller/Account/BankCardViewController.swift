//
//  BankCardViewController.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/12/18.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit

class BankCardViewController: BaseViewController {

    //MARK: - 懒加载
    lazy var administrationBtn: UIButton = { [unowned self] in
        let administrationBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
        administrationBtn.setTitle("管理", for: .normal)
        administrationBtn.setTitleColor(kTitleColor, for: .normal)
        administrationBtn.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        //        detailBtn.addTarget(self, action: #selector(registerVc), for: .touchUpInside)
        return administrationBtn
        }()
    
    lazy var collectionView: UICollectionView = { [unowned self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kScreenWidth - 32, height: 120)
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.view.addSubview(collectionView)
        collectionView.backgroundColor = UIColor.white
        collectionView.pan_registerCell(cell: BankCardCollectionViewCell.self)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
        }()
    
    //内部属性
    fileprivate var bankCardArr = [UserModel]()
    
    //MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "银行卡"
        view.backgroundColor = UIColor.white
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: administrationBtn)
        collectionView.addHeaderRefresh { [weak self] in
            self?.getBankCardData()
        }
        collectionView.beginHeaderRefresh()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        isNavLineHidden = false
    }
    
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        super .viewWillAppear(animated)
//        (navigationController as? AXDNavigationController)?.navBarHairlineImageView?.isHidden = false
//    }
    
    override func viewWillLayoutSubviews() {
        super .viewWillLayoutSubviews()
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        collectionView.layoutIfNeeded()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super .viewWillDisappear(animated)
        isNavLineHidden = true
    }
//    override func viewWillDisappear(_ animated: Bool) {
//        super .viewWillDisappear(animated)
//        (navigationController as? AXDNavigationController)?.navBarHairlineImageView?.isHidden = true
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

//MARK: - 数据处理
extension BankCardViewController {
    func getBankCardData() {
        var parameters = [String: Any]()
        parameters["token"] = UserManager.shareManager.userModel.token
        NetWorksManager.requst(with: kUrl_BankCardList, type: .post, parameters: parameters) { [weak self] (jsonData, error) in
            if jsonData?["status"] == 200 {
                if let dataArr = jsonData?["data"].array {
                    var bankDataArr = [UserModel]()
                    for data in dataArr {
                        bankDataArr.append(UserModel(with: data))
                    }
                    self?.bankCardArr = bankDataArr
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
            self?.collectionView.endHeaderRefresh()
        }
    }
}

//MARK: - CollectionView代理
extension BankCardViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.pan_dequeueReusableCell(indexPath: indexPath) as BankCardCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = BindingCardFirstViewController.loadStoryboard()
        navigationController?.pushViewController(vc, animated: true)
    }
}