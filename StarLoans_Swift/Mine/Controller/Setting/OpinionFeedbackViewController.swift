//
//  opinionFeedbackViewController.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2018/1/4.
//  Copyright © 2018年 iOS Pan. All rights reserved.
//

import UIKit

class OpinionFeedbackViewController: BaseViewController, StoryboardLoadable {
    @IBOutlet weak var opinionTV: MyTextView!
    @IBOutlet weak var commitBtn: UIButton!
    
    //MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "意见反馈"
        view.backgroundColor = kHomeBackColor
        setupBasic()
    }
    
    func setupBasic() {
        opinionTV.placeholder = "感谢您使用安小贷APP，使用过程中有任何意见或建议请反馈给我们。"
        commitBtn.layer.cornerRadius = commitBtn.height/2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func commitBtnClick(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
