//
//  LoansDetailViewController.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/12/26.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit

class LoansDetailViewController: BaseViewController, StoryboardLoadable {
    @IBOutlet weak var mainView: UIView!
    ///产品介绍
    @IBOutlet weak var productView: LoansProductView!
    ///产品优势
    @IBOutlet weak var advantageView: UIView!
    @IBOutlet weak var advenContentLB: UILabel!
    @IBOutlet weak var advenContentTransView: UIView!
    @IBOutlet weak var lookMoreBtn: UIButton!
    ///利率详情
    @IBOutlet weak var interestRateView: UIView!
    ///费用计算
    @IBOutlet weak var costCountView: UIView!
    @IBOutlet weak var moneyTF: UITextField!
    @IBOutlet weak var costCountLB: UILabel!
    ///办理流程
    @IBOutlet weak var flowView: UIView!
    ///申请条件
    @IBOutlet weak var conditionView: UIView!
    @IBOutlet weak var conditionContentLB: UILabel!
    ///所需材料
    @IBOutlet weak var materialsView: UIView!
    @IBOutlet weak var materialsContentLB: UILabel!
    ///问题讨论
    @IBOutlet weak var moreProblemBtn: UIButton!
    @IBOutlet weak var problemView: UIView!
    @IBOutlet weak var problemTableView: UITableView!
    @IBOutlet weak var problemTableViewHeight: NSLayoutConstraint!
    //MARK: - 可操作数据
    var cellHeightArr: [CGFloat] = [CGFloat]()
    //MARK: - 懒加载
    ///利率图标
    lazy var gridView: GridView = { [unowned self] in
        let gridView =  GridView(frame: .zero, collectionViewLayout: UICollectionGridViewLayout())
        gridView.setColumns(columns: ["抵押比例", "7成", "8成", "9成", "10成"])
        gridView.addRow(row: ["年化利率", "8%", "9%", "10%", "11%"])
        self.interestRateView.addSubview(gridView)
        return gridView
    }()
    //MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "宅e贷"
        setupBasic()
    }
    
    ///控件基本配置
    func setupBasic() {
        //产品优势
        advenContentLB.sizeToFit()
        advenContentLB.numberOfLines = 5
        advenContentLB.text = "as款到发货开始的恢复还是快递费开始的疯狂舒服点发了就类似的纠纷就历史记录发就栏数据分类经历是地方加逻辑酸辣粉就类似的纠纷了就是了房价历史记录发就是离开房间拉"
        //费用计算
        moneyTF.keyboardType = .numberPad
        moneyTF.addTarget(self, action: #selector(costCount(_:)), for: .editingChanged)
        costCountLB.adjustsFontSizeToFitWidth = true
        //申请条件
        conditionContentLB.sizeToFit()
        conditionContentLB.numberOfLines = 0
        //所需材料
        materialsContentLB.sizeToFit()
        materialsContentLB.numberOfLines = 0
        //问题讨论
        problemTableView.pan_registerCell(cell: ProblemCell.self)
        problemTableView.isScrollEnabled = false
        problemTableView.delegate = self
        problemTableView.dataSource = self
        problemTableView.estimatedRowHeight = 160
        problemTableView.rowHeight = UITableViewAutomaticDimension
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        isNavLineHidden = false
    }
    
    override func viewWillLayoutSubviews() {
        super .viewWillLayoutSubviews()
        mainView.snp.makeConstraints { (make) in
            make.width.equalTo(kScreenWidth)
        }
        advenContentTransView.translucence()
        
        gridView.snp.makeConstraints { (make) in
            make.bottom.equalTo(-18)
            make.left.equalTo(48)
            make.right.equalTo(-48)
            make.height.equalTo(71)
        }
        
        if cellHeightArr.count != 0  {
            var tableViewHeight: CGFloat = 0
            for height in cellHeightArr {
                tableViewHeight += height
            }
            problemTableViewHeight.constant = tableViewHeight
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super .viewWillDisappear(animated)
        isNavLineHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func lookMore(_ sender: UIButton) {
        if sender.isSelected == false {
            sender.isSelected = true
            
            advenContentTransView.isHidden = true
            advenContentLB.numberOfLines = 0
            advenContentLB.text = "as款到发货开始的恢复还是快递费开始的疯狂舒服点发了就类似的纠纷就历史记录发就栏数据分类经历是地方加逻辑酸辣粉就类似的纠纷了就是了房价历史记录发就是离开房间拉克丝解放路就是了房价栏数据分类就是浪费就栏数据分类就是了房价历史记录发尽量as款到发货开始的恢复还是快递费开始的疯狂舒服点发了就类似的纠纷就历史记录发就栏数据分类经历是地方加逻辑酸辣粉就类似的纠纷了就是了房价历史记录发就是离开房间拉克丝解放路就是了房价栏数据分类就是浪费就栏数据分类就是了房价历史记录发尽量as款到发货开始的恢复还是快递费开始的疯狂舒服点发了就类似的纠纷就历史记录发就栏数据分类经历是地方加逻辑酸辣粉就类似的纠纷了就是了房价历史记录发就是离开房间拉克丝解放路就是了房价栏数据分类就是浪费就栏数据分类就是了房价历史记录发尽量as款到发货开始的恢复还是快递费开始的疯狂舒服点发了就类似的纠纷就历史记录发就栏数据分类经历是地方加逻辑酸辣粉就类似的纠纷了就是了房价历史记录发就是离开房间拉克丝解放路就是了房价栏数据分类就是浪费就栏数据分类就是了房价历史记录发尽量as款到发货开始的恢复还是快递费开始的疯狂舒服点发了就类似的纠纷就历史记录发就栏数据分类经历是地方加逻辑酸辣粉就类似的纠纷了就是了房价历史记录发就是离开房间拉克丝解放路就是了房价栏数据分类就是浪费就栏数据分类就是了房价历史记录发尽量"
            
        }else {
            sender.isSelected = false
    
            advenContentTransView.isHidden = false
            advenContentLB.numberOfLines = 5
            advenContentLB.text = "as款到发货开始的恢复还是快递费开始的疯狂舒服点发了就类似的纠纷就历史记录发就栏数据分类经历是地方加逻辑酸辣粉就类似的纠纷了就是了房价历史记录发就是离开房间拉"
        }
        
        
    }
    
    ///费用计算
    @objc func costCount(_ sender: UITextField) {
        guard (sender.text?.isPurnInt())! else {
            costCountLB.text = "费用: "
            return
        }
        let cost = Double(sender.text!)! * 10000 * 0.08
        if cost > 10000 {
            if Int(sender.text!)! > 99999{
                costCountLB.text = "超出可贷款金额"
            }else {
                costCountLB.text = "费用: " + String(cost/10000) + "万"
            }
        }else {
            costCountLB.text = "费用: " + String(cost)
        }
    }
    
    @IBAction func moreProblemClick(_ sender: UIButton) {
        print("更多问题")
    }
}

extension LoansDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.pan_dequeueReusableCell(indexPath: indexPath) as ProblemCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cellHeightArr.append(cell.height)
    }
}
