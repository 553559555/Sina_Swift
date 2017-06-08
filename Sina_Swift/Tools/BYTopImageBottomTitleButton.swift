//
//  BYTopImageBottomTitleButton.swift
//  iOS_Swift_iPay
//
//  Created by 王壮 on 2017/5/8.
//  Copyright © 2017年 Arther. All rights reserved.
//

import UIKit

class BYTopImageBottomTitleButton: UIButton {

    override var isHighlighted: Bool{
        get{
            return false
        }
        set{
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 设置视图
    private func setupUI(){
        // 设置imageView
        imageView?.contentMode = .center
        // 设置tilte
        titleLabel?.textAlignment = .center
        titleLabel?.font = UIFont.systemFont(ofSize: 12)
        setTitleColor(UIColor.darkGray, for: .normal)
    }
    
    // 对其子控件重新布局
    override func layoutSubviews() {
        super.layoutSubviews()
        // 设置imageView
        imageView?.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: 30)
        // 设置title
        titleLabel?.frame = CGRect(x: 0, y: 32, width: self.frame.width, height: 12)
    }

}
