//
//  QuickBillDetailViewController.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2018/1/3.
//  Copyright © 2018年 iOS Pan. All rights reserved.
//

import UIKit

class QuickBillDetailViewController: BaseViewController, StoryboardLoadable{
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var constrainstsHeight: NSLayoutConstraint!
    @IBOutlet weak var constrainstsWidth: NSLayoutConstraint!
    //贷款需求
    @IBOutlet weak var loanNeedLB: UILabel!
    //贷款周期
    @IBOutlet weak var loanCycleLB: UILabel!
    //需求程度
    @IBOutlet weak var needDayLB: UILabel!
    //切换控件
    @IBOutlet weak var segmentView: UIView!
    //抢单支付按钮
    @IBOutlet weak var commitBtn: UIButton!
    
    lazy var segmentview: SMSegmentView = { [unowned self] in
        let appearance = SMSegmentAppearance()
        appearance.segmentOnSelectionColour = UIColor.white
        appearance.segmentOffSelectionColour = UIColor.white
        appearance.titleOnSelectionFont = UIFont.systemFont(ofSize: 15.0)
        appearance.titleOffSelectionFont = UIFont.systemFont(ofSize: 15.0)
        appearance.titleOnSelectionColour = kMainColor
        appearance.titleOffSelectionColour = kTitleColor
        appearance.contentVerticalMargin = 10.0
        appearance.titleGravity = .right
        
        let segmentview = SMSegmentView(frame: .zero, dividerColour: UIColor.RGB(with: 210, green: 210, blue: 210), dividerWidth: 0, segmentAppearance: appearance)
        self.segmentView.addSubview(segmentview)
        segmentview.backgroundColor = UIColor.white
        segmentview.addSegmentWithTitle("个人信息", onSelectionImage: nil, offSelectionImage: nil)
        segmentview.addSegmentWithTitle("资产信息", onSelectionImage: nil, offSelectionImage: nil)
        segmentview.selectedSegmentIndex = 0
        segmentview.addTarget(self, action: #selector(selectSegmentInSegmentView(segmentView:)), for: .valueChanged)
        return segmentview
        }()
    
    //MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBasic()
    }
    
    func setupBasic() {
        scrollView.backgroundColor = UIColor.white
        scrollView.delegate = self
        commitBtn.layer.cornerRadius = commitBtn.height/2
    }
    
    override func viewWillLayoutSubviews() {
        super .viewWillLayoutSubviews()
        
        segmentview.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        constrainstsWidth.constant = kScreenWidth
        constrainstsHeight.constant = scrollView.height
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func selectSegmentInSegmentView(segmentView: SMSegmentView) {
        let x = kScreenWidth * CGFloat(segmentView.selectedSegmentIndex)
        scrollView.setContentOffset(CGPoint(x: x, y: 0), animated: true)
    }
    
    //抢单按钮点击
    @IBAction func commitBtnClick(_ sender: UIButton) {
        let vc = DBPayCompleteViewController.loadStoryboard()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

//MARK: - UIScrollView代理
extension QuickBillDetailViewController: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if scrollView == self.scrollView {
            segmentview.selectedSegmentIndex = Int(self.scrollView.contentOffset.x / kScreenWidth)
        }
    }
}