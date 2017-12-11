//
//  CheshiTableViewCell.swift
//  StarLoans_Swift
//
//  Created by iOS Pan on 2017/12/7.
//  Copyright © 2017年 iOS Pan. All rights reserved.
//

import UIKit

class CheshiTableViewCell: UITableViewCell {
    
    var newFrame: CGRect?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = UIColor.blue
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        let newFrame = frame
        print("newFrame:\(newFrame)")
    }
    
//    override var frame: CGRect {
//        didSet {
//            var newFrame = frame
//            print("frame:\(frame)")
//            newFrame.origin.x  = newFrame.origin.x
//            newFrame.size.width  = newFrame.size.width
//            newFrame.origin.y += 8
//            newFrame.size.height = newFrame.size.height
//            super.frame = newFrame
//        }
//    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
