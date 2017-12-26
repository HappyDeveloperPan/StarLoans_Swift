//
//  VideoDetailViewController.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/12/25.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit

class VideoDetailViewController: BaseViewController, StoryboardLoadable {

    var videoID: Int = 0
    var videoModel: VideoModel = VideoModel()
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var videoImg: UIImageView!
    @IBOutlet weak var titleLB: UILabel!
    @IBOutlet weak var videoTypeLB: UILabel!
    @IBOutlet weak var readNumLB: UILabel!
    @IBOutlet weak var topTimeLB: UILabel!
    
    @IBOutlet weak var themeLB: UILabel!
    @IBOutlet weak var themeContent: UILabel!
    @IBOutlet weak var timeLB: UILabel!
    @IBOutlet weak var timeContent: UILabel!
    @IBOutlet weak var mainGuestLb: UILabel!
    @IBOutlet weak var mainGuestContent: UILabel!
    @IBOutlet weak var sponsorLB: UILabel!
    @IBOutlet weak var sponsorContent: UILabel!
    @IBOutlet weak var durationLB: UILabel!
    @IBOutlet weak var durationContent: UILabel!
    @IBOutlet weak var videoIntroLB: UILabel!
    @IBOutlet weak var videoIntroContent: UILabel!
    @IBOutlet weak var freePlayBtn: UIButton!
    @IBOutlet weak var payPlayBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "视频详情"
        setupBasic()
        getVideoDetailData()
    }
    
    func setupBasic() {
        videoTypeLB.layer.backgroundColor = UIColor.RGB(with: 248, green: 225, blue: 225).cgColor
        videoTypeLB.layer.cornerRadius = videoTypeLB.height/2
        readNumLB.sizeToFit()
        themeLB.textAlignmentLeftAndRight()
        timeLB.textAlignmentLeftAndRight()
        mainGuestLb.textAlignmentLeftAndRight()
        sponsorLB.textAlignmentLeftAndRight()
        durationLB.textAlignmentLeftAndRight()
        videoIntroLB.textAlignmentLeftAndRight()
        videoIntroContent.numberOfLines = 0
        videoIntroContent.sizeToFit()
    }
    
    override func viewWillLayoutSubviews() {
        super .viewWillLayoutSubviews()
        mainView.snp.makeConstraints { (make) in
            make.width.equalTo(kScreenWidth)
        }
        
        freePlayBtn.snp.makeConstraints { (make) in
            make.width.equalTo(kScreenWidth/2)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func freePlayClick(_ sender: UIButton) {
        let vc = VideoPlayViewController()
        vc.videoModel = videoModel
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func payPlayClick(_ sender: UIButton) {
        let vc = VideoPlayViewController()
        vc.videoModel = videoModel
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension VideoDetailViewController {
    func getVideoDetailData() {
        
        let parameters = ["video_id": videoID] as [String: Any]
        
        JSProgress.showBusy()
        
        NetWorksManager.requst(with: kUrl_VideoDetail, type: .post, parameters: parameters) { [weak self](jsonData, error) in
            
            JSProgress.hidden()
            
            if jsonData?["status"] == 200 {
                self?.videoModel = VideoModel(with: jsonData!["data"][0])
                self?.titleLB.text = self?.videoModel.video_title
                self?.videoTypeLB.text = self?.videoModel.getVideoType()
                self?.readNumLB.text = String(describing: self?.videoModel.video_view_count)
                self?.themeContent.text = self?.videoModel.video_title
                self?.videoIntroContent.text = self?.videoModel.video_desc
            }else {
                if error == nil {
                    JSProgress.showFailStatus(with: (jsonData?["msg"].stringValue)!)
                }else {
                    JSProgress.showFailStatus(with: "请求失败")
                }
            }
        }
        
    }
}
