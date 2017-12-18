//
//  AXDNavigationController.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/12/13.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit

class AXDNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navBar = navigationBar
        navBar.isTranslucent = false
        navBar.barStyle = .default
        navBar.barTintColor = .white
        navBar.tintColor = kTitleColor
        navBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navBar.shadowImage = UIImage()
        navBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:kTitleColor]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
//        viewController.navigationItem.hidesBackButton=true
        
        if childViewControllers.count>0{
            
//            UINavigationBar.appearance().backItem?.hidesBackButton = false
            
            viewController.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
            viewController.hidesBottomBarWhenPushed = true
            
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
}

