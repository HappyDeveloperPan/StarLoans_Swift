//
//  PushClientResourceTableViewController.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2018/1/2.
//  Copyright © 2018年 iOS Pan. All rights reserved.
//

import UIKit

fileprivate enum UploadsType {
    case IDCardsFront   //身份证正面
    case IDCardsBack    //身份证反面
    case IDCardsOrBL    //手持身份证或者营业执照
    case OtherProperty  //其他资产
}

class PushClientResourceTableViewController: UITableViewController {
    //抢单价
    @IBOutlet weak var priceTF: UITextField!
    //贷款金额
    @IBOutlet weak var loansMoneyTF: UITextField!
    //贷款周期
    @IBOutlet weak var loansCycleTF: UITextField!
    //需求天数
    @IBOutlet weak var needDayTF: UITextField!
    //客户姓名
    @IBOutlet weak var userNameTF: UITextField!
    //联系电话
    @IBOutlet weak var telephoneTF: UITextField!
    //职业
    @IBOutlet weak var professionLB: UILabel!
    //月收入
    @IBOutlet weak var incomeTF: UITextField!
    //工资发放形式
    @IBOutlet weak var salaryTypeLB: UILabel!
    //社保情况
    @IBOutlet weak var socialSecurityRadioBtnView: RadioBtnView!
    //公积金情况
    @IBOutlet weak var providentFundRadioBtnView: RadioBtnView!
    //房产类型
    @IBOutlet weak var houseTypeLB: UILabel!
    //车产类型
    @IBOutlet weak var carTypeLB: UILabel!
    //其他资产
    @IBOutlet weak var otherPropertyTF: UITextField!
    //上传身份证正面
    @IBOutlet weak var IDCardsFrontBtn: UIButton!
    //上传身份证反面
    @IBOutlet weak var IDCardsBackBtn: UIButton!
    //上传房产证明
    @IBOutlet weak var houseCertiBtn: UIButton!
    //上传其他资产证明
    @IBOutlet weak var uploadOtherPropertyBtn: UIButton!
    //MARK: - 可操作数据
    fileprivate let sectionHeaderArr:[String] = ["贷款信息", "个人信息", "资产信息"]
    fileprivate var uploadsType: UploadsType?
    
    //MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        socialSecurityRadioBtnView.hSingleSelBtn(titleArray: ["有社保", "无社保"], typeE: 1)
        providentFundRadioBtnView.hSingleSelBtn(titleArray: ["有公积金", "无公积金"], typeE: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return 3
        }
        if section == 1 {
            return 6
        }
        if section == 2 {
            return 4
        }
        return 0
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
    
    ///职业选择
    @IBAction func professionBtnClick(_ sender: UIButton) {
        let pickerView = PickerView()
        pickerView.changeTitleAndClosure = { [weak self] (title:String , num : Int)  in
            self?.professionLB.text = title
        }
        pickerView.nameArr = ["上班族", "个体户", "学生", "企业主", "无固定职业"]
        kMainWindow??.addSubview(pickerView)
    }
    ///工资发放形式
    @IBAction func salaryBtnClick(_ sender: UIButton) {
        let pickerView = PickerView()
        pickerView.changeTitleAndClosure = { [weak self] (title:String , num : Int)  in
            self?.salaryTypeLB.text = title
        }
        pickerView.nameArr = ["现金发放","银行代发","现金和银行代发结合"]
        kMainWindow??.addSubview(pickerView)
    }
    ///房产类型
    @IBAction func houseTypeBtnClick(_ sender: UIButton) {
        let pickerView = PickerView()
        pickerView.changeTitleAndClosure = { [weak self] (title:String , num : Int)  in
            self?.houseTypeLB.text = title
        }
        pickerView.nameArr = ["无房产","贷款房","红本房","商铺","小产权房"]
        kMainWindow??.addSubview(pickerView)
    }
    ///车产类型
    @IBAction func carTypeBtnClick(_ sender: UIButton) {
        let pickerView = PickerView()
        pickerView.changeTitleAndClosure = { [weak self] (title:String , num : Int)  in
            self?.carTypeLB.text = title
        }
        pickerView.nameArr = ["无车","有贷款车","有全款车"]
        kMainWindow??.addSubview(pickerView)
    }
    ///上传身份证正面
    @IBAction func uploadIDCardsFront(_ sender: UIButton) {
        uploadsType = UploadsType.IDCardsFront
        uploadsPic()
    }
    ///上传身份证反面
    @IBAction func uploadIDCardsBack(_ sender: UIButton) {
        uploadsType = UploadsType.IDCardsBack
        uploadsPic()
    }
    ///上传房产证明
    @IBAction func uploadHouseCerti(_ sender: UIButton) {
        uploadsType = UploadsType.IDCardsOrBL
        uploadsPic()
    }
    ///上传其他资产证明
    @IBAction func uploadOtherProperty(_ sender: UIButton) {
        uploadsType = UploadsType.OtherProperty
        uploadsPic()
    }
    
    ///提交资料
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

extension PushClientResourceTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //查看info对象
        print(info)
        //显示的图片
        let image:UIImage!
        image = info[UIImagePickerControllerEditedImage] as! UIImage
        switch uploadsType {
        case .IDCardsFront?:
            IDCardsFrontBtn.setImage(image, for: .normal)
        case .IDCardsBack?:
            IDCardsBackBtn.setImage(image, for: .normal)
        case .IDCardsOrBL?:
            houseCertiBtn.setImage(image, for: .normal)
        case .OtherProperty?:
            uploadOtherPropertyBtn.setImage(image, for: .normal)
        default:
            break
        }
        //图片控制器退出
        picker.dismiss(animated: true, completion: {
            () -> Void in
        })
    }
}
