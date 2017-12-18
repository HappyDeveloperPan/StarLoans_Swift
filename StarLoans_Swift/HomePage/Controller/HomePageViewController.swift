//
//  HomePageViewController.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/11/7.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit


fileprivate let IMAGE_HEIGHT:CGFloat = 200
fileprivate let NAVBAR_COLORCHANGE_POINT:CGFloat = IMAGE_HEIGHT - CGFloat(64 * 2)

//MARK: - 界面部分
class HomePageViewController: UIViewController {
    weak var navController: UINavigationController?
    //记录顶部状态栏颜色
    var statusBarColor:UIStatusBarStyle = .default {
        didSet {
            UIApplication.shared.statusBarStyle = statusBarColor
        }
    }
    //MARK: - 主界面部分
    lazy var mainView: UIScrollView = { [unowned self] in
        let mainView = UIScrollView()
        self.view.addSubview(mainView)
        mainView.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1)
        mainView.showsVerticalScrollIndicator = false
        mainView.showsHorizontalScrollIndicator = false
        if #available(iOS 11.0, *) {
            mainView.contentInsetAdjustmentBehavior = .never
        }
        mainView.delegate = self
        return mainView
    }()
    
    ///顶部渐变搜索栏
    lazy var navView: UIView = { [unowned self] in
        let navView = UIView()
        self.view.addSubview(navView)
        navView.backgroundColor = kMainColor
        navView.alpha = 0
        return navView
    }()
    
    lazy var addressBtn: UIButton = { [unowned self] in
        let addressBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 45, height: 30))
        self.view.addSubview(addressBtn)
        addressBtn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        addressBtn.setTitleColor(UIColor.white, for: .normal)
        addressBtn.set(image: #imageLiteral(resourceName: "ICON-xiala"), title: "定位", titlePosition: .left, additionalSpacing: 2, state: .normal)
        return addressBtn
    }()
    
    lazy var searchView: SearchView = { [unowned self] in
        let searchView = SearchView()
        self.view.addSubview(searchView)
        searchView.layer.cornerRadius = 17
        searchView.alpha = 0.7
        return searchView
    }()
    
    ///顶部广告栏
    lazy var topAdBannerView: TopAdverView = { [unowned self] in
        let topAdBannerView = TopAdverView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 235))
        self.mainView.addSubview(topAdBannerView)
        topAdBannerView.adverDelegate = self
        return topAdBannerView
    }()
    
    ///功能栏
    lazy var functionView: FunctionView = { [unowned self] in
        let functionView = FunctionView()
        self.mainView.addSubview(functionView)
        functionView.delegate = self
        return functionView
    }()
    
    ///视频栏
    lazy var videoView: VideoView = { [unowned self] in
        let videoView = VideoView()
        self.mainView.addSubview(videoView)
        return videoView
    }()
    
    ///产品代理
    lazy var hotAgencyView: HotAgencyView = { [unowned self] in
        let hotAgencyView = HotAgencyView()
        self.mainView.addSubview(hotAgencyView)
        return hotAgencyView
    }()
    
    ///急速抢单
    lazy var quickRobView: QuickRobView = { [unowned self] in
        let quickRobView = QuickRobView()
        self.mainView.addSubview(quickRobView)
        return quickRobView
    }()
    
    ///信用卡专区
    lazy var partnerPlanView: PlanView = { [unowned self] in
        let partnerPlanView = PlanView()
        self.mainView.addSubview(partnerPlanView)
        return partnerPlanView
    }()
    
    ///消息栏
    lazy var infoView: InformationView = { [unowned self] in
        let infoView = InformationView()
        self.mainView.addSubview(infoView)
        return infoView
    }()
    
    ///资讯研读
    lazy var messageReadView: MessageReadView = { [unowned self] in
        let messageReadView = MessageReadView()
        self.mainView.addSubview(messageReadView)
        return messageReadView
    }()
    
    //MARK: - 可操作数据
    ///广告栏数据
    var adverList: Array<String> = ["http://p.lrlz.com/data/upload/mobile/special/s252/s252_05471521705899113.png",
                                    "http://p.lrlz.com/data/upload/mobile/special/s303/s303_05442007678060723.png",
                                    "http://p.lrlz.com/data/upload/mobile/special/s303/s303_05442007470310935.png"]
    
    ///视频栏数据
    
    
    //MARK: - 生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        automaticallyAdjustsScrollViewInsets = false
//        edgesForExtendedLayout = .top
        //获取广告数据刷新界面
        topAdBannerView.serverImgArray = adverList
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
//        navigationController?.navigationBar.isHidden = true
//        navigationController?.setNavigationBarHidden(true, animated: true)
        topAdBannerView.isAutoScroll = true
        UIApplication.shared.statusBarStyle = statusBarColor
        
        navigationController?.delegate = self
        navController = navigationController
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        ///全局滚动视图
        mainView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        ///渐变假nav栏
        navView.snp.makeConstraints { (make) in
            make.top.left.right.equalToSuperview()
            make.size.equalTo(CGSize(width: kScreenWidth, height: kNavHeight))
        }
        ///搜索视图
        addressBtn.snp.makeConstraints { (make) in
            make.left.equalTo(10)
            make.top.equalTo(kStatusHeight + 2)
            make.height.equalTo(34)
        }
        addressBtn.layoutIfNeeded()
        
        searchView.snp.makeConstraints { (make) in
            make.top.equalTo(kStatusHeight + 2)
            make.left.equalTo(addressBtn.snp.right).offset(8)
            make.right.equalTo(-30)
            make.height.equalTo(34)
        }
        searchView.layoutIfNeeded()
    
        ///广告栏
        topAdBannerView.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview()
            make.width.equalTo(kScreenWidth)
            make.height.equalTo(235)
        }
        topAdBannerView.layoutIfNeeded()
        
        ///功能栏
        functionView.snp.makeConstraints { (make) in
            make.top.equalTo(topAdBannerView.snp.bottom)
            make.left.equalToSuperview()
            make.width.equalTo(kScreenWidth)
            make.height.equalTo(200)
        }
        functionView.layoutIfNeeded()
        
        ///视频栏
        videoView.snp.makeConstraints { (make) in
            make.top.equalTo(functionView.snp.bottom)
            make.left.right.equalToSuperview()
            make.width.equalTo(kScreenWidth)
            make.height.equalTo(175 + 12 + 12)
        }
        videoView.layoutIfNeeded()
        
        ///热门栏
        hotAgencyView.snp.makeConstraints { (make) in
            make.top.equalTo(videoView.snp.bottom)
            make.left.right.equalToSuperview()
            make.size.equalTo(CGSize(width: kScreenWidth, height: 375))
        }
        hotAgencyView.layoutIfNeeded()
        
        ///急速抢单
        quickRobView.snp.makeConstraints { (make) in
            make.top.equalTo(hotAgencyView.snp.bottom).offset(8.5)
            make.left.right.equalToSuperview()
            make.size.equalTo(CGSize(width: kScreenWidth, height: 376))
        }
        quickRobView.layoutIfNeeded()
        
        ///信用卡专区
        partnerPlanView.snp.makeConstraints { (make) in
            make.top.equalTo(quickRobView.snp.bottom).offset(8)
            make.left.right.equalToSuperview()
            make.size.equalTo(CGSize(width: kScreenWidth, height: 206))
            
        }
        partnerPlanView.layoutIfNeeded()
        
        ///消息栏
        infoView.snp.makeConstraints { (make) in
            make.top.equalTo(partnerPlanView.snp.bottom).offset(8)
            make.left.right.equalToSuperview()
            make.size.equalTo(CGSize(width: kScreenWidth, height: 30))
        }
        infoView.layoutIfNeeded()
        
        ///资讯栏
        messageReadView.snp.makeConstraints { (make) in
            make.top.equalTo(infoView.snp.bottom).offset(8)
            make.left.right.equalToSuperview()
            make.size.equalTo(CGSize(width: kScreenWidth, height: 353))
            make.bottom.equalToSuperview()
        }
        messageReadView.layoutIfNeeded()
        //layoutNeeded可以立即获取到frame
        mainView.layoutIfNeeded()
//        mainView.contentSize = CGSize(width: kScreenWidth, height: kScreenHeight * 3)
    }
    

    override func viewWillDisappear(_ animated: Bool) {
        super .viewWillDisappear(animated)
//        navigationController?.navigationBar.isHidden = false
//        navigationController?.setNavigationBarHidden(false, animated: true)
        topAdBannerView.isAutoScroll = false
        UIApplication.shared.statusBarStyle = .default
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

//MARK: - 滚动代理
extension HomePageViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        let offsetY = scrollView.contentOffset.y
        if (offsetY > NAVBAR_COLORCHANGE_POINT)
        {
            let alpha = (offsetY - NAVBAR_COLORCHANGE_POINT) / CGFloat(64)
            navView.alpha = alpha
//            UIApplication.shared.statusBarStyle = .lightContent
            statusBarColor = .lightContent
        }
        else
        {
            navView.alpha = 0
//            UIApplication.shared.statusBarStyle = .default
            statusBarColor = .default
        }
    }
}

//MARK: - 顶部广告栏代理
extension HomePageViewController: TopAdverViewDelegate {
    /// 点击图片回调
    func topAdverViewDidSelect(at index: Int, cycleScrollView: WRCycleScrollView) {
        print("点击了第\(index+1)个图片")
    }
    /// 图片滚动回调
    func topAdverViewDidScroll(to index: Int, cycleScrollView: WRCycleScrollView) {
        print("滚动到了第\(index+1)个图片")
    }
}

//MARK: - 工具栏代理
extension HomePageViewController: FunctionViewDelegate {
    func buttonDidSelect(at index: Int) {
        switch index {
        case 1:
            let vc = BusinessResourceViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = LoansCollegeViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 4:
            let vc = SignInViewController.loadStoryboard()
            navigationController?.pushViewController(vc, animated: true)
        case 6:
            let vc = VideoCenterViewController()
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
}

//MARK: - UINavigationController代理
extension HomePageViewController: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool) {
        if viewController == self {
            navController?.setNavigationBarHidden(true, animated: animated)
        }
        else {
            //不在本页时，显示真正的nav bar
            navController?.setNavigationBarHidden(false, animated: animated)
            //当不显示本页时，要么就push到下一页，要么就被pop了，那么就将delegate设置为nil，防止出现BAD ACCESS
            //之前将这段代码放在viewDidDisappear和dealloc中，这两种情况可能已经被pop了，self.navigationController为nil，这里采用手动持有navigationController的引用来解决
            if navController?.delegate === self  {
                //如果delegate是自己才设置为nil，因为viewWillAppear调用的比此方法较早，其他controller如果设置了delegate就可能会被误伤
                navController?.delegate = nil
            }
        }
    }
}

