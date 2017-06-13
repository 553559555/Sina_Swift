//
//  WZUserInfoView.swift
//  Sina_Swift
//
//  Created by 王壮 on 2017/6/9.
//  Copyright © 2017年 Arther. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

class WZUserInfoView: UIView {
    
    private var icon : UIImageView?
    private var name : UILabel?
    private var time : UILabel?
    private var from : UILabel?
    private var text : UILabel?
    
    public var model : WZHomeModel? {
        didSet {
            name?.text = model?.name
            icon?.kf.setImage(with: URL(string: (model?.icon)!), placeholder: #imageLiteral(resourceName: "defult"), options: nil, progressBlock: nil, completionHandler: nil)
            time?.text = model?.time
            text?.text = model?.text
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        addChildViews()
        addChildLayouts()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addChildViews() {
        
        icon = UIImageView()
        icon?.backgroundColor = UIColor.red
        icon?.layer.cornerRadius = 40 * HEIGHT_RATIO
        icon?.layer.masksToBounds = true
        addSubview(icon!)
        
        name = UILabel()
        name?.text = "握刀狂砍🐷队友"
        name?.textColor = UIColor.orange
        name?.font = UIFont.systemFont(ofSize: 14)
        addSubview(name!)
        
        time = UILabel()
        time?.text = "刚刚"
        time?.textColor = UIColor.colorWithHexString(hex: "b0b0b0")
        time?.font = UIFont.systemFont(ofSize: 11)
        addSubview(time!)
        
        from = UILabel()
        from?.text = "来自新浪微博"
        from?.textColor = UIColor.colorWithHexString(hex: "b0b0b0")
        from?.font = UIFont.systemFont(ofSize: 11)
        addSubview(from!)
        
        text = UILabel()
        text?.text = "全球最大的笑话发布中心，笑话 - 糗事 - 雷事 - 囧事- 星级笑话 ,让你每日笑不停 合作联系QQ2894247217"
        text?.font = UIFont.systemFont(ofSize: 14)
        text?.numberOfLines = 0
        addSubview(text!)
        
    }
    
    private func addChildLayouts() {
        
        icon?.snp.makeConstraints({ (make) in
            make.top.equalTo(self).offset(20 * HEIGHT_RATIO)
            make.left.equalTo(self).offset(15 * WIDTH_RATIO)
            make.size.equalTo(CGSize(width: 80 * HEIGHT_RATIO, height: 80 * HEIGHT_RATIO))
        })
        
        name?.snp.makeConstraints({ (make) in
            make.left.equalTo((icon?.snp.right)!).offset(10 * WIDTH_RATIO)
            make.bottom.equalTo((icon?.snp.centerY)!).offset(-5 * HEIGHT_RATIO)
        })
        
        time?.snp.makeConstraints({ (make) in
            make.left.equalTo(name!)
            make.top.equalTo((name?.snp.bottom)!).offset(10 * HEIGHT_RATIO)
        })
        
        from?.snp.makeConstraints({ (make) in
            make.top.equalTo(time!)
            make.left.equalTo((time?.snp.right)!).offset(5 * WIDTH_RATIO)
        })
        
        text?.snp.makeConstraints({ (make) in
            make.top.equalTo((icon?.snp.bottom)!).offset(10 * HEIGHT_RATIO)
            make.left.equalTo(icon!)
            make.right.equalTo(self).offset(-15 * WIDTH_RATIO)
        })
        
        self.snp.makeConstraints({ (make) in
            make.bottom.equalTo(text!).offset(10 * HEIGHT_RATIO)
        })
        
    }

}
