//
//  MineTableViewController.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/12/16.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit

public let kReloadUserData = "reloadUserData"

class MineTableViewController: UITableViewController {

    //MARK: - 控件加载
    @IBOutlet weak var accountNumberLB: UILabel!
    @IBOutlet weak var indentCell: UITableViewCell!
    @IBOutlet weak var endShopCell: UITableViewCell!
    //  用户名
    @IBOutlet weak var userNameBtn: UIButton!
    @IBOutlet weak var userNameBtnTop: NSLayoutConstraint!
    //  用户头像
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var userImgTop: NSLayoutConstraint!
    //  用户认证
    @IBOutlet weak var approveBackView: UIView!
    @IBOutlet weak var approveImg: UIImageView!
    @IBOutlet weak var approveLB: UILabel!
    
    fileprivate let indentArr:Array<Any> = ["已推订单", "已发资源", "已发产品", "急速抢单"]
    fileprivate let endShopArr:Array<Any> = ["视频", "推广工具", "客户名单", "文案教程"]
    
    //MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupConfig()
        setupIndentCellUI()
        setupendShopCellUI()
        NotificationCenter.default.addObserver(self, selector: #selector(reloadUserData), name: NSNotification.Name(rawValue: kReloadUserData), object: nil)
        reloadUserData()
    }
    
    //基本配置
    func setupConfig() {
        view.backgroundColor = kHomeBackColor
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }
        tableView.tableHeaderView?.height = kNavHeight + 45
        
//        userImg.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(userImgCli
        userImg.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(userImgClick(_:))))
        userImg.isUserInteractionEnabled = true
        
        userNameBtn.contentHorizontalAlignment = .left
        userNameBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0 )
        userNameBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        userNameBtnTop.constant = kStatusHeight + 10
        userImgTop.constant = kStatusHeight + 8
        let corners: UIRectCorner = [.topLeft,.bottomLeft]
        approveBackView.corner(with: approveBackView.bounds, corners: corners, radii: 15)
    }
    
    func setupIndentCellUI() {
        
        let labWidth = (indentCell.contentView.width-30) / 4
        
        for index in 0...3 {
            let numberLB = UILabel()
            numberLB.textColor = kMainColor
            numberLB.textAlignment = .center
            numberLB.font = UIFont.systemFont(ofSize: 16)
            numberLB.tag = index + 1
            numberLB.text = "0"
            indentCell.contentView.addSubview(numberLB)
            
            let nameLB = UILabel()
            nameLB.textColor = kTitleColor
            nameLB.textAlignment = .center
            nameLB.font = UIFont.systemFont(ofSize: 12)
            nameLB.tag = (index + 1) * 10
            nameLB.text = indentArr[index] as? String
            indentCell.contentView.addSubview(nameLB)
            
            numberLB.snp.makeConstraints({ (make) in
                make.centerY.equalToSuperview()
                make.left.equalTo(labWidth * CGFloat(index))
                make.size.equalTo(CGSize(width: labWidth, height: 20))
            })
            
            nameLB.snp.makeConstraints({ (make) in
                make.top.equalTo(numberLB.snp.bottom).offset(8)
                make.left.equalTo(labWidth * CGFloat(index))
                make.size.equalTo(CGSize(width: labWidth, height: 20))
            })
        }
    }
    
    func setupendShopCellUI() {
        
        let labWidth = (endShopCell.contentView.width-30) / 4
        
        for index in 0...3 {
            let numberLB = UILabel()
            numberLB.textColor = kMainColor
            numberLB.textAlignment = .center
            numberLB.font = UIFont.systemFont(ofSize: 16)
            numberLB.tag = index + 1
            numberLB.text = "0"
            endShopCell.contentView.addSubview(numberLB)
            
            let nameLB = UILabel()
            nameLB.textColor = kTitleColor
            nameLB.textAlignment = .center
            nameLB.font = UIFont.systemFont(ofSize: 12)
            nameLB.tag = (index + 1) * 10
            nameLB.text = endShopArr[index] as? String
            endShopCell.contentView.addSubview(nameLB)
            
            numberLB.snp.makeConstraints({ (make) in
                make.centerY.equalToSuperview()
                make.left.equalTo(labWidth * CGFloat(index))
                make.size.equalTo(CGSize(width: labWidth, height: 20))
            })
            
            nameLB.snp.makeConstraints({ (make) in
                make.top.equalTo(numberLB.snp.bottom).offset(8)
                make.left.equalTo(labWidth * CGFloat(index))
                make.size.equalTo(CGSize(width: labWidth, height: 20))
            })
        }
    }
    
    
//    override func viewWillAppear(_ animated: Bool) {
//        super .viewWillAppear(animated)
//        if UserManager.shareManager.isLogin {
//            reloadUserData()
//        }
//    }
    
    override func viewWillLayoutSubviews() {
        super .viewWillLayoutSubviews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 {
            return 3
        }else {
            return 4
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath {
        case [0, 0]:
            let vc = AccountViewController.loadStoryboard()
            navigationController?.pushViewController(vc, animated: true)
        case [1, 1]:
            let vc = SettingViewController.loadStoryboard()
            navigationController?.pushViewController(vc, animated: true)
        case [1, 2]:
            let vc = CommonProblemViewController()
            navigationController?.pushViewController(vc, animated: true)
        case [1, 3]:
            let vc = AboutViewController.loadStoryboard()
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
        
    }
    
    //MARK: - Method
    @IBAction func userNameBtnClick(_ sender: UIButton) {
        //如果用户没有登录就跳转到登录界面
        guard UserManager.shareManager.isLogin else {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: kPresentLogin), object: nil)
            return
        }
    }
    
    @objc func userImgClick(_ sender: UIGestureRecognizer) {
        let vc = UserDataViewController.loadStoryboard()
        navigationController?.pushViewController(vc, animated: true)
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//MARK: - 数据处理部分
extension MineTableViewController {
    @objc func reloadUserData() {
        if UserManager.shareManager.isLogin {
            userNameBtn.setTitle(UserManager.shareManager.userModel?.user, for: .normal)
        }else {
            userNameBtn.setTitle("未登录", for: .normal)
        }
    }
}
