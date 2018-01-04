//
//  InfoDetailViewController.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2018/1/2.
//  Copyright © 2018年 iOS Pan. All rights reserved.
//

import UIKit

class InfoDetailViewController: BaseViewController, StoryboardLoadable {
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var userNameLB: UILabel!
    @IBOutlet weak var timeLB: UILabel!
    @IBOutlet weak var questionLB: UILabel!
    @IBOutlet weak var answerTV: MyTextView!
    
    //MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "问题详情"
        setupBasic()
    }
    
    func setupBasic() {
        questionLB.numberOfLines = 0
        questionLB.sizeToFit()
        answerTV.placeholder = "请输入回答..."
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        isNavLineHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super .viewWillDisappear(animated)
        isNavLineHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func commitBtnClick(_ sender: UIButton) {
        
    }
    
}
