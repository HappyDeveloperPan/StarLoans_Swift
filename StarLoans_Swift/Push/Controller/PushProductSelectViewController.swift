//
//  PushProductSelectViewController.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2018/1/9.
//  Copyright © 2018年 iOS Pan. All rights reserved.
//

import UIKit

class PushProductSelectViewController: BaseViewController {
    //MARK: - 懒加载
    lazy var typeBtn: UIButton = { [unowned self] in
        let typeBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        typeBtn.setImage(#imageLiteral(resourceName: "ICON-MORE"), for: .normal)
        typeBtn.addTarget(self, action: #selector(selectType(_:)), for: .touchUpInside)
        return typeBtn
        }()
    
    lazy var popMenu: SwiftPopMenu = { [unowned self] in
        let popMenu =  SwiftPopMenu(frame: CGRect(x: kScreenWidth - 105 - 16, y: kStatusHeight + 44, width: 105, height: 230))
        popMenu.popData = [(icon:"",title:"全部"),
                           (icon:"",title:"企业信用"),
                           (icon:"",title:"企业抵押"),
                           (icon:"",title:"个人信用"),
                           (icon:"",title:"个人抵押")]
        //点击菜单
        popMenu.didSelectMenuBlock = { [weak self](index:Int)->Void in
            self?.popMenu.dismiss()
            print("block select \(index)")
        }
        return popMenu
    }()
    
    lazy var collectionView: UICollectionView = { [unowned self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kScreenWidth-32, height: 240)
        layout.minimumLineSpacing = 18
        layout.sectionInset = UIEdgeInsets(top: 18, left: 0, bottom: 18, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        self.view.addSubview(collectionView)
        if #available(iOS 11.0, *) {
            collectionView.contentInsetAdjustmentBehavior = .never
        }
        collectionView.backgroundColor = kHomeBackColor
        collectionView.pan_registerCell(cell: PushBillProductCell.self)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
        }()
    
    //MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "选择推单产品"
        view.backgroundColor = kHomeBackColor
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: typeBtn)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        isNavLineHidden = false
    }
    
    override func viewWillLayoutSubviews() {
        super .viewWillLayoutSubviews()
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super .viewWillDisappear(animated)
        isNavLineHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @objc func selectType(_ sender: UIButton) {
        showMenu()
    }
    
    func showMenu() {
        popMenu.show()
    }
    
    //一个弹出视图动画
    func shakeToShow(aView: UIView) {
        let animation = CAKeyframeAnimation(keyPath: "transform")
        animation.duration = 0.5
        var values = [Any]()
        values.append(NSValue(caTransform3D: CATransform3DMakeScale(0.1, 0.1, 1.0)))
        values.append(NSValue(caTransform3D: CATransform3DMakeScale(1.2, 1.2, 1.0)))
        values.append(NSValue(caTransform3D: CATransform3DMakeScale(0.9, 0.9, 1.0)))
        values.append(NSValue(caTransform3D: CATransform3DMakeScale(1.0, 1.0, 1.0)))
        animation.values = values
        aView.layer.add(animation, forKey: nil)
    }

}

//MARK: - UICollectionView代理
extension PushProductSelectViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.pan_dequeueReusableCell(indexPath: indexPath) as PushBillProductCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = LoansDetailViewController.loadStoryboard()
        navigationController?.pushViewController(vc, animated: true)
    }
}
