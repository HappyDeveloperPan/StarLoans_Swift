//
//  PushProductResourceViewController.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2018/1/2.
//  Copyright © 2018年 iOS Pan. All rights reserved.
//

import UIKit

class PushProductResourceViewController: BaseViewController, StoryboardLoadable{

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "发布产品资源"
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
    }

}
