//
//  InputUserInfoTableViewController.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/12/28.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit

fileprivate enum UploadsType {
    case IDCardsFront   //身份证正面
    case IDCardsBack    //身份证反面
    case IDCardsOrBL    //手持身份证或者营业执照
    case OtherProperty  //其他资产
}

class InputUserInfoTableViewController: UITableViewController {
    //服务费
    @IBOutlet weak var serviceChargeCell: UITableViewCell!
    @IBOutlet weak var ServiceChargeTF: UITextField!
    //贷款需求
    @IBOutlet weak var LoansNeedTF: UITextField!
    //企业名称
    @IBOutlet weak var CompanyNameCell: UITableViewCell!
    @IBOutlet weak var CompanyNameTF: UITextField!
    //企业法人
    @IBOutlet weak var CompanyLegalPersonCell: UITableViewCell!
    @IBOutlet weak var CompanyLegalPersonTF: UITextField!
    //客户姓名
    @IBOutlet weak var userNameCell: UITableViewCell!
    @IBOutlet weak var userNameTF: UITextField!
    //联系电话
    @IBOutlet weak var telephoneCell: UITableViewCell!
    @IBOutlet weak var telephoneTF: UITextField!
    //身份证号
    @IBOutlet weak var IDCardsCell: UITableViewCell!
    @IBOutlet weak var IDCardsTF: UITextField!
    //职业
    @IBOutlet weak var professionCell: UITableViewCell!
    @IBOutlet weak var professionLB: UILabel!
    //月收入
    @IBOutlet weak var incomeCell: UITableViewCell!
    @IBOutlet weak var incomeTF: UITextField!
    //工资发放形式
    @IBOutlet weak var salaryTypeCell: UITableViewCell!
    @IBOutlet weak var salaryTypeLB: UILabel!
    //员工人数
    @IBOutlet weak var employeeNumCell: UITableViewCell!
    @IBOutlet weak var employeeTF: UITextField!
    //社保情况
    @IBOutlet weak var socialSecurityCell: UITableViewCell!
    @IBOutlet weak var socialSecurityRadioBtnView: RadioBtnView!
    //公积金情况
    @IBOutlet weak var providentFundCell: UITableViewCell!
    @IBOutlet weak var providentFundRadioBtnView: RadioBtnView!
    //房产类型
    @IBOutlet weak var houseTypeLB: UILabel!
    //车产类型
    @IBOutlet weak var carTypeLB: UILabel!
    //信用情况
    @IBOutlet weak var creditTypeLB: UILabel!
    //其他资产
    @IBOutlet weak var otherPropertyCell: UITableViewCell!
    @IBOutlet weak var otherPropertyTF: UITextField!
    //上传身份证正面
    @IBOutlet weak var IDCardsFrontBtn: UIButton!
    //上传身份证反面
    @IBOutlet weak var IDCardsBackBtn: UIButton!
    //上传手持身份证或者营业执照
    @IBOutlet weak var uploadIDCardsOrBLBtn: UIButton!
    @IBOutlet weak var uploadIDCardsOrBLLB: UILabel!
    //上传其他资产证明
    @IBOutlet weak var uploadOtherPropertyBtn: UIButton!
    
    //MARK: - 可操作数据
    fileprivate let sectionHeaderArr:[String] = ["基本信息", "资产信息"]
    fileprivate var uploadsType: UploadsType?
    //MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        
        serviceChargeCell.isHidden = true
        socialSecurityRadioBtnView.hSingleSelBtn(titleArray: ["有社保", "无社保"], typeE: 1)
        providentFundRadioBtnView.hSingleSelBtn(titleArray: ["有公积金", "无公积金"], typeE: 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 8
        }else {
            return 9
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 48
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 && indexPath.section == 0 {
            return 0
        }
        return super .tableView(tableView, heightForRowAt: indexPath)
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
    ///信用情况
    @IBAction func CreditTypeBtnClick(_ sender: UIButton) {
        let pickerView = PickerView()
        pickerView.changeTitleAndClosure = { [weak self] (title:String , num : Int)  in
            self?.creditTypeLB.text = title
        }
        pickerView.nameArr = ["信用良好", "无逾期", "一年内超过3次逾期", "一年内少于3次逾期"]
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
    ///上传手持身份证或者营业执照
    @IBAction func uploadIDCardsOrBL(_ sender: UIButton) {
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

extension InputUserInfoTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
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
            uploadIDCardsOrBLBtn.setImage(image, for: .normal)
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

//MARK: - TableViewSection头视图
class SectionHeaderView: UIView {
    lazy var topBackView: UIView = { [unowned self] in
        let topBackView = UIView()
        self.addSubview(topBackView)
        topBackView.backgroundColor = kHomeBackColor
        return topBackView
    }()
    
    lazy var verLine: UIView = { [unowned self] in
        let verLine = UIView()
        self.addSubview(verLine)
        verLine.backgroundColor = kMainColor
        return verLine
    }()
    
    lazy var titleLB: UILabel = { [unowned self] in
        let titleLB = UILabel()
        self.addSubview(titleLB)
        titleLB.textColor = kTitleColor
        titleLB.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return titleLB
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        backgroundColor = UIColor.white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func layoutSubviews() {
        super .layoutSubviews()
        topBackView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(8)
        }
        
        verLine.snp.makeConstraints { (make) in
            make.top.equalTo(topBackView.snp.bottom).offset(10)
            make.left.equalTo(16)
            make.size.equalTo(CGSize(width: 2, height: 15))
        }
        
        titleLB.snp.makeConstraints { (make) in
            make.top.equalTo(topBackView.snp.bottom).offset(11)
            make.left.equalTo(verLine.snp.right).offset(5)
            make.size.equalTo(CGSize(width: 80, height: 14))
        }
    }
}