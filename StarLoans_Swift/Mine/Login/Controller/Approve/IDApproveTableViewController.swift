//
//  IDApproveTableViewController.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2018/1/5.
//  Copyright © 2018年 iOS Pan. All rights reserved.
//

import UIKit

enum ApproveType {
    case managerIdentity    //机构经理身份认证
    case managerJob         //机构经理工作认证
    case brokerIdentity     //经纪人身份认证
    case brokerJob          //经纪人工作认证
}

fileprivate enum UploadBtnType {
    case uploadLeft     //左边按钮
    case uploadRight    //右边按钮
}

class IDApproveTableViewController: UITableViewController {
    @IBOutlet weak var IDFlowImg: UIImageView!
    @IBOutlet weak var jobFlowImg: UIImageView!
    @IBOutlet weak var IDFlowLB: UILabel!
    @IBOutlet weak var jobFlowLB: UILabel!
    
    @IBOutlet weak var cellHeadTitle: UILabel!
    
    @IBOutlet weak var cellOneTitleLB: UILabel!
    @IBOutlet weak var cellOneTF: UITextField!
    
    @IBOutlet weak var cellTwo: UITableViewCell!
    @IBOutlet weak var cellTwoTitleLB: UILabel!
    @IBOutlet weak var cellTwoTF: UITextField!
    @IBOutlet weak var cellTwoContentLB: UILabel!
    
    @IBOutlet weak var cellThreeTitleLB: UILabel!
    @IBOutlet weak var cellThreeTF: UITextField!
    
    @IBOutlet weak var uploadLeftBtn: UIButton!
    @IBOutlet weak var uploadLeftLB: UILabel!
    @IBOutlet weak var uploadRightBtn: UIButton!
    @IBOutlet weak var uploadRightLB: UILabel!
    @IBOutlet weak var commitBtn: UIButton!
    
    //MARK: - 可操作数据
    var approveType: ApproveType = .managerIdentity
    fileprivate var uploadBtnType: UploadBtnType?
    //MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBasic()
    }
    
    func setupBasic() {
        switch approveType {
        case .brokerJob:
            IDFlowImg.image = #imageLiteral(resourceName: "ICON-shouquanchenggong")
            jobFlowImg.image = #imageLiteral(resourceName: "ICON-shouquanqueren")
            IDFlowLB.font = UIFont.systemFont(ofSize: 14)
            jobFlowLB.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            cellHeadTitle.text = "机构信息"
            cellOneTitleLB.text = "公司名称"
            cellOneTF.placeholder = "请输入公司名称"
            cellTwo.accessoryType = .disclosureIndicator
            cellTwoTitleLB.text = "公司类型"
            cellTwoTF.isHidden = true
            cellTwoContentLB.isHidden = false
            cellTwoContentLB.text = "请选择公司类型"
            cellThreeTitleLB.text = "详细地址"
            cellThreeTF.placeholder = "区县街道门牌信息"
            uploadLeftLB.text = "请上传公司LOGO"
            uploadRightLB.text = "请上传工牌和名片"
            commitBtn.setTitle("确认提交", for: .normal)
        case .managerJob:
            IDFlowImg.image = #imageLiteral(resourceName: "ICON-shouquanchenggong")
            jobFlowImg.image = #imageLiteral(resourceName: "ICON-shouquanqueren")
            IDFlowLB.font = UIFont.systemFont(ofSize: 14)
            jobFlowLB.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            cellHeadTitle.text = "机构信息"
            cellOneTitleLB.text = "机构名称"
            cellOneTF.placeholder = "请输入机构名称"
            cellTwoTitleLB.text = "详细地址"
            cellTwoTF.placeholder = "区县街道门牌信息'"
            cellThreeTitleLB.text = "所属营业厅"
            cellThreeTF.placeholder = "请输入营业厅名称"
            uploadLeftLB.text = "请上传公司LOGO"
            uploadRightLB.text = "请上传工牌和名片"
            commitBtn.setTitle("确认提交", for: .normal)
        default: break
        }
        commitBtn.layer.cornerRadius = commitBtn.height/2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    @IBAction func uploadLeftBtnClick(_ sender: UIButton) {
        uploadBtnType = UploadBtnType.uploadLeft
        uploadsPic()
    }
    @IBAction func uploadRightBtnClick(_ sender: UIButton) {
        uploadBtnType = UploadBtnType.uploadRight
        uploadsPic()
    }
    ///根据页面类型确定提交点击事件
    @IBAction func commitBtnClick(_ sender: UIButton) {
        switch approveType {
        case .brokerIdentity:
            let vc = IDApproveViewController.loadStoryboard()
            vc.approveType = .brokerJob
            navigationController?.pushViewController(vc, animated: true)
        case .managerIdentity:
            let vc = IDApproveViewController.loadStoryboard()
            vc.approveType = .managerJob
            navigationController?.pushViewController(vc, animated: true)
        case .brokerJob:
            commitApproveData()
        case .managerJob:
            commitApproveData()
        }
    }
    
    ///上传图片
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

extension IDApproveTableViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //查看info对象
        print(info)
        //显示的图片
        let image:UIImage!
        image = info[UIImagePickerControllerEditedImage] as! UIImage
        switch uploadBtnType {
        case .uploadLeft?:
            uploadLeftBtn.setImage(image, for: .normal)
        case .uploadRight?:
            uploadRightBtn.setImage(image, for: .normal)
        default: break
        }
        //图片控制器退出
        picker.dismiss(animated: true, completion: {
            () -> Void in
        })
    }
}

extension IDApproveTableViewController {
    func commitApproveData() {
        //跳转回银行卡界面并且刷新
        for controller: UIViewController in (navigationController?.viewControllers)! {
            if (controller is ApproveSelectViewController) {
                let vc = controller as? ApproveSelectViewController
                navigationController?.popToViewController(vc ?? UIViewController(), animated: true)
            }
        }
    }
}
