//
//  AXDNavigationController.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/12/13.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit

class AXDNavigationController: UINavigationController {

    var navBarHairlineImageView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navBarHairlineImageView = findHairlineImageViewUnder(navigationBar)
//        navBarHairlineImageView?.isHidden = true
        
        let navBar = navigationBar
        navBar.isTranslucent = false
        navBar.barStyle = .default
        navBar.barTintColor = .white
        navBar.tintColor = kTitleColor
//        navBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
//        navBar.shadowImage = UIImage()
        navBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor:kTitleColor]
        
    }
    
    ///获取navigationBar底部黑线
    func findHairlineImageViewUnder(_ view: UIView) -> UIImageView? {
        if (view is UIImageView) && view.bounds.size.height <= 1.0 {
            return (view as? UIImageView) ?? UIImageView()
        }
        for subview: UIView in view.subviews {
            let imageView: UIImageView? = findHairlineImageViewUnder(subview)
            if imageView != nil {
                return imageView ?? UIImageView()
            }
        }
        return nil
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        print("AXDNavigationController销毁了")
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
//        viewController.navigationItem.hidesBackButton=true
        
        if childViewControllers.count>0{
            
//            UINavigationBar.appearance().backItem?.hidesBackButton = false
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
            viewController.hidesBottomBarWhenPushed = true
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
}

