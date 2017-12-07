//
//  AXDTabBarViewController.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/11/28.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit
import ESTabBarController_swift

class AXDTabBarViewController: ESTabBarController{

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        addChildViewControllers()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    private func addChildViewControllers()  {
        
        let nav1 = addChildViewController(childViewController: HomePageViewController(), contentView: AXDTabBarItemContentView(), title: "首页", image:#imageLiteral(resourceName: "ICON-homepage") , selectedImage: #imageLiteral(resourceName: "ICON-homepage-select"), isNav: false)
        let nav2 = addChildViewController(childViewController: LoansViewController(), contentView: AXDTabBarItemContentView(), title: "贷款", image: #imageLiteral(resourceName: "ICON-loans"), selectedImage: #imageLiteral(resourceName: "ICON-loans-select"), isNav: true)
        let nav3 = addChildViewController(childViewController: PushViewController(), contentView: AXDIrregularityTabBarItemContentView(), title: nil, image: #imageLiteral(resourceName: "ICON-tuidan"), selectedImage: #imageLiteral(resourceName: "ICON-tuidan"), isNav: true)
        let nav4 = addChildViewController(childViewController: InformationViewController(), contentView: AXDTabBarItemContentView(), title: "消息", image: #imageLiteral(resourceName: "ICON-xiaoxi"), selectedImage: #imageLiteral(resourceName: "ICON-xiaoxi-select"), isNav: true)
        let nav5 = addChildViewController(childViewController: MineViewController(), contentView: AXDTabBarItemContentView(), title: "我的", image: #imageLiteral(resourceName: "ICON-mine"), selectedImage: #imageLiteral(resourceName: "ICON-mine-select"), isNav: true)
        
        viewControllers = [nav1, nav2, nav3, nav4, nav5]
    }
    
    private func addChildViewController(childViewController: UIViewController,
                                        contentView: ESTabBarItemContentView?,
                                        title: String?,
                                        image: UIImage,
                                        selectedImage: UIImage,
                                        isNav: Bool) -> UIViewController {
        childViewController.title = title
        childViewController.tabBarItem = ESTabBarItem(contentView!, title: title, image: image, selectedImage: selectedImage)
        if isNav {
            let nav = UINavigationController(rootViewController:childViewController)
            return nav
        }
        return childViewController
    }
    
    ///跳转到登录界面
    func notifPresentLogin(notif:NSNotification?) {
        var selectNavVC = selectedViewController as? UINavigationController
        if selectNavVC?.presentedViewController != nil {
            selectNavVC = selectNavVC?.presentedViewController as? UINavigationController
        }
        let loginVC = LoginViewController()
        let navVC = UINavigationController(rootViewController: loginVC as? UIViewController ?? UIViewController())

        selectNavVC?.present(navVC, animated: true, completion: {

        })
    }

}

extension AXDTabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("\(viewController)")
        print("\(String(describing: viewControllers?.index(of: viewController)))")
        if (viewControllers?.contains(viewController))! && viewControllers!.index(of: viewController)! >= 4 {
            notifPresentLogin(notif: nil)
        }
    }
}


