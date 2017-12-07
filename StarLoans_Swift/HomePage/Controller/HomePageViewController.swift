//
//  HomePageViewController.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/11/7.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit

//MARK: - 界面部分
class HomePageViewController: UIViewController {
    
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
//        mainView.contentSize = CGSize(width: kScreenWidth, height: kScreenHeight * 2)
        return mainView
    }()
    
    lazy var addressBtn: UIButton = { [unowned self] in
        let addressBtn = UIButton()
        self.view.addSubview(addressBtn)
        addressBtn.setTitle("深圳ⅴ", for: .normal)
        addressBtn.setTitleColor(UIColor.white, for: .normal)
        return addressBtn
    }()
    
    ///搜索栏
    lazy var searchView: UITextField = { [unowned self] in
        let searchView = UITextField()
        self.view.addSubview(searchView)
        searchView.placeholder = "经纪人 视频 资讯"
        searchView.backgroundColor = UIColor.white
        searchView.layer.cornerRadius = 8
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
    
    //合伙人计划
    lazy var partnerPlanView: PlanView = { [unowned self] in
        let partnerPlanView = PlanView()
        self.mainView.addSubview(partnerPlanView)
        return partnerPlanView
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
//        edgesForExtendedLayout = .top
        //获取广告数据刷新界面
        topAdBannerView.serverImgArray = adverList
        //注册cell
//        videoView.register(VideoCollectionViewCell.self, forCellWithReuseIdentifier: "VideoCollectionViewCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        topAdBannerView.isAutoScroll = true
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        mainView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
        
        addressBtn.snp.makeConstraints { (make) in
            make.left.equalTo(13.5)
            make.top.equalTo(20)
            make.size.equalTo(CGSize(width: 60, height: 36))
        }
        
        searchView.snp.makeConstraints { (make) in
            make.top.equalTo(20)
            make.left.equalTo(addressBtn.snp.right)
            make.right.equalTo(-30)
            make.height.equalTo(36)
//            make.size.equalTo(CGSize(width: kScreenWidth - 60, height: 40))
        }
    
        topAdBannerView.snp.makeConstraints { (make) in
            make.top.left.equalToSuperview()
            make.width.equalTo(kScreenWidth)
            make.height.equalTo(235)
        }
        topAdBannerView.layoutIfNeeded()
        
        functionView.snp.makeConstraints { (make) in
            make.top.equalTo(topAdBannerView.snp.bottom)
            make.left.equalToSuperview()
            make.width.equalTo(kScreenWidth)
            make.height.equalTo(200)
        }
        functionView.layoutIfNeeded()
        
        videoView.snp.makeConstraints { (make) in
            make.top.equalTo(functionView.snp.bottom)
            make.left.right.equalToSuperview()
            make.width.equalTo(kScreenWidth)
            make.height.equalTo(175 + 12 + 12)
        }
        videoView.layoutIfNeeded()
        
        hotAgencyView.snp.makeConstraints { (make) in
            make.top.equalTo(videoView.snp.bottom)
            make.left.right.equalToSuperview()
            make.size.equalTo(CGSize(width: kScreenWidth, height: 375))
        }
        hotAgencyView.layoutIfNeeded()
        
        quickRobView.snp.makeConstraints { (make) in
            make.top.equalTo(hotAgencyView.snp.bottom).offset(8.5)
            make.left.right.equalToSuperview()
            make.size.equalTo(CGSize(width: kScreenWidth, height: 376))
        }
        quickRobView.layoutIfNeeded()
        
        partnerPlanView.snp.makeConstraints { (make) in
            make.top.equalTo(quickRobView.snp.bottom).offset(8)
            make.left.right.equalToSuperview()
            make.size.equalTo(CGSize(width: kScreenWidth, height: 206))
            
        }
        partnerPlanView.layoutIfNeeded()
        
        messageReadView.snp.makeConstraints { (make) in
            make.top.equalTo(partnerPlanView.snp.bottom).offset(8)
            make.left.right.equalToSuperview()
            make.size.equalTo(CGSize(width: kScreenWidth, height: 353))
            make.bottom.equalToSuperview()
        }
        
        //layoutNeeded可以立即获取到frame
        mainView.layoutIfNeeded()
//        mainView.contentSize = CGSize(width: kScreenWidth, height: kScreenHeight * 3)
        print(mainView.frame)

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        print("已经加入窗口")
    }

    override func viewWillDisappear(_ animated: Bool) {
        super .viewWillDisappear(animated)
        topAdBannerView.isAutoScroll = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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

//MARK: - 视频栏代理
//extension HomePageViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 3
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "VideoCollectionViewCell", for: indexPath)
//        return cell
//    }
//}

