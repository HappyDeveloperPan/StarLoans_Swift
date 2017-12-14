//
//  SignInViewController.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/12/13.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit

fileprivate let kLableWidth:CGFloat = 35.0
fileprivate let kLabbleSpace = (kScreenWidth - 35.0*7) / 8
fileprivate let dayArr = ["+5分", "未签到", "+5分", "+6分", "+7分", "+8分", "+9分"]
fileprivate let dateArr = ["11.23", "昨天", "今天", "明天", "11.27", "11.28", "11.29"]

class SignInViewController: UIViewController, StoryboardLoadable {

    @IBOutlet weak var integralLB: UILabel!
    @IBOutlet weak var contiSignInLB: UILabel!
    @IBOutlet weak var signInBorder: UIImageView!
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var todayintegralLB: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "每日签到"
        view.backgroundColor = UIColor.white
        setNavigationBarConfig()
        createDayLB()
    }
    
    func createDayLB() {
        for index in 1...7 {
            //签到分数lable
            let dayLB = UILabel()
            signInBorder.addSubview(dayLB)
            dayLB.tag = index
            dayLB.text = dayArr[index - 1]
            dayLB.textAlignment = .center
            dayLB.font = UIFont.systemFont(ofSize: 10)
            dayLB.layer.cornerRadius = 17.5
            if index < 3 {
                dayLB.textColor = UIColor.white
                dayLB.layer.backgroundColor = UIColor.RGB(with: 223, green: 114, blue: 114).cgColor
            }else {
                dayLB.textColor = UIColor.RGB(with: 223, green: 114, blue: 114)
                dayLB.layer.borderWidth = 1
                dayLB.layer.borderColor = UIColor.RGB(with: 223, green: 114, blue: 114).cgColor
            }
            
            //签到日期lable
            let dateLB = UILabel()
            signInBorder.addSubview(dateLB)
            dateLB.tag = index * 10
            dateLB.text = dateArr[index - 1]
            dateLB.textColor = UIColor.RGB(with: 51, green: 51, blue: 51)
            dateLB.textAlignment = .center
            dateLB.font = UIFont.systemFont(ofSize: 10)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    override func viewWillLayoutSubviews() {
        super .viewWillLayoutSubviews()
        for index in 1...7 {
            let dayLB = view.viewWithTag(index) as? UILabel
            dayLB?.snp.makeConstraints({ (make) in
                make.top.equalTo(10)
                make.left.equalTo((kLableWidth+kLabbleSpace)*CGFloat(index)-kLableWidth)
                make.size.equalTo(CGSize(width: 35, height: 35))
            })
            
            let dateLB = view.viewWithTag(index*10) as? UILabel
            dateLB?.snp.makeConstraints({ (make) in
                make.top.equalTo((dayLB?.snp.bottom)!)
                make.left.equalTo((kLableWidth+kLabbleSpace)*CGFloat(index)-kLableWidth)
                make.size.equalTo(CGSize(width: 35, height: 18))
            })
        }
    }
    
    //签到成功修改状态
    @IBAction func signInBtnClick(_ sender: UIButton) {
        JSProgress.showSucessStatus(with: "签到成功")
        
        let dayLB = view.viewWithTag(3) as? UILabel
        dayLB?.textColor = UIColor.white
        dayLB?.layer.backgroundColor = UIColor.RGB(with: 223, green: 114, blue: 114).cgColor
        contiSignInLB.isHidden = false
        
        signInBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        signInBtn.titleLabel?.textColor = kTitleColor
        let myAttrString = NSMutableAttributedString(string: "1天")
        let myAttribute = [ NSAttributedStringKey.foregroundColor: UIColor.RGB(with: 223, green: 114, blue: 114),NSAttributedStringKey.font: UIFont.systemFont(ofSize: 40) ]
        myAttrString.addAttributes(myAttribute, range: NSRange(location: 0, length: myAttrString.length - 1))
        signInBtn.setAttributedTitle(myAttrString, for: .normal)
        
        todayintegralLB.text = "明日签到可领6积分"
    }
    
}
