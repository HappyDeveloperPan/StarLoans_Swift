//
//  PushProductResourceTableViewController.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2018/1/2.
//  Copyright © 2018年 iOS Pan. All rights reserved.
//

import UIKit

class PushProductResourceTableViewController: UITableViewController {
    //公司LOGO
    @IBOutlet weak var logoLB: UILabel!
    @IBOutlet weak var logoBtn: UIButton!
    //公司名称
    @IBOutlet weak var CompanyNameTF: UITextField!
    //产品名称
    @IBOutlet weak var productNameTF: UITextField!
    //贷款范围
    @IBOutlet weak var loansRange1TF: UITextField!
    @IBOutlet weak var loansRange2TF: UITextField!
    //贷款类别
    @IBOutlet weak var loansTypeLB: UILabel!
    //返佣比例
    @IBOutlet weak var returnMoneyTF: UITextField!
    //月利率
    @IBOutlet weak var monthInterestRateTF: UITextField!
    //产品优势
    @IBOutlet weak var productAdvenTV: MyTextView!
    //办理流程
    @IBOutlet weak var flow1TF: UITextField!
    @IBOutlet weak var flow2TF: UITextField!
    @IBOutlet weak var flow3TF: UITextField!
    @IBOutlet weak var flow4TF: UITextField!
    //申请条件
    @IBOutlet weak var conditionTV: MyTextView!
    //所需材料
    @IBOutlet weak var needMaterialsTV: MyTextView!
    
    //MARK: - 可操作数据
    fileprivate let sectionHeaderArr:[String] = ["基本信息", "产品优势", "办理流程", "申请条件", "所需材料"]
    
    //MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBasic()
    }
    
    func setupBasic() {
        productAdvenTV.placeholder = "请言简意赅的介绍您的产品优势，好的产品介绍会提高成单率。"
        productAdvenTV.layer.borderWidth = 0.5
        productAdvenTV.layer.cornerRadius = 5
        productAdvenTV.layer.borderColor = UIColor.RGB(with: 198, green: 198, blue: 198).cgColor
        
        conditionTV.placeholder = "请简要描述申请条件"
        conditionTV.layer.borderWidth = 0.5
        conditionTV.layer.cornerRadius = 5
        conditionTV.layer.borderColor = UIColor.RGB(with: 198, green: 198, blue: 198).cgColor
        
        needMaterialsTV.placeholder = "请简要描述所需材料"
        needMaterialsTV.layer.borderWidth = 0.5
        needMaterialsTV.layer.cornerRadius = 5
        needMaterialsTV.layer.borderColor = UIColor.RGB(with: 198, green: 198, blue: 198).cgColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 7
        }else {
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 48
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = SectionHeaderView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 30))
        view.titleLB.text = sectionHeaderArr[section]
        return view
    }
    
    ///上传公司logo
    @IBAction func uploadOtherProperty(_ sender: UIButton) {
        uploadsPic()
    }
    
    ///选择贷款类别
    @IBAction func loansTypeBtnClick(_ sender: UIButton) {
        let pickerView = PickerView()
        pickerView.changeTitleAndClosure = { [weak self] (title:String , num : Int)  in
            self?.loansTypeLB.text = title
        }
        pickerView.nameArr = ["个人抵押", "企业抵押", "个人信用", "企业信用"]
        kMainWindow??.addSubview(pickerView)
    }
    
    ///提交信息
    @IBAction func commitBtnClick(_ sender: UIButton) {
        let alertController = UIAlertController(title: "提交审核", message: "请确认信息准确无误后提交", preferredStyle: .alert)
        let selectOne = UIAlertAction(title: "返回修改", style: .cancel, handler: nil)
        let selectTwo = UIAlertAction(title: "确认", style: .destructive) { [weak self] (action) in
            let vc = CommitCompleteViewController.loadStoryboard()
            self?.navigationController?.pushViewController(vc, animated: true)
        }
        alertController.addAction(selectOne)
        alertController.addAction(selectTwo)
        present(alertController, animated: true, completion: nil)
    }
    
    func uploadsPic() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let selectOne = UIAlertAction(title: "拍照", style: .default) { [weak self] (action) in
            if UIImagePickerController.isSourceTypeAvailable(.camera) {
                //初始化图片控制器
                let picker = UIImagePickerController()
                //设置代理
                picker.delegate = self
                //指定图片控制器类型
                picker.sourceType = UIImagePickerControllerSourceType.camera
                //设置是否允许编辑
                picker.allowsEditing = true
                //弹出控制器，显示界面
                self?.present(picker, animated: true, completion: {
                    () -> Void in
                })
            }else {
                JSProgress.showFailStatus(with: "相机不可用")
            }
        }
        let selectTwo = UIAlertAction(title: "从手机相册选择", style: .default) { [weak self] (action) in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                //初始化图片控制器
                let picker = UIImagePickerController()
                //设置代理
                picker.delegate = self
                //指定图片控制器类型
                picker.sourceType = UIImagePickerControllerSourceType.photoLibrary
                //设置是否允许编辑
                picker.allowsEditing = true
                //弹出控制器，显示界面
                self?.present(picker, animated: true, completion: {
                    () -> Void in
                })
            }else {
                JSProgress.showFailStatus(with: "相册不可访问")
            }
        }
        let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alertController.addAction(selectOne)
        alertController.addAction(selectTwo)
        alertController.addAction(cancel)
        present(alertController, animated: true, completion: nil)
    }
}

extension PushProductResourceTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //查看info对象
        print(info)
        //显示的图片
        let image:UIImage!
        image = info[UIImagePickerControllerEditedImage] as! UIImage
        logoBtn.setImage(image, for: .normal)
        logoLB.text = ""
        //图片控制器退出
        picker.dismiss(animated: true, completion: {
            () -> Void in
        })
    }
}
