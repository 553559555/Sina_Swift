//
//  WZToolViewCell.swift
//  Sina_Swift
//
//  Created by neoby on 2018/5/10.
//  Copyright © 2018年 Arther. All rights reserved.
//

import UIKit

class WZToolViewCell: UIView {
    
    private var shareButton  : UIButton!
    private var commentButton: UIButton!
    private var commendButton: UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        addSubViewLayout()
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubViews()
        addSubViewLayout()
    }
    
    private func addSubViews() {
        
        shareButton = addSubButton(title: "12", tag: #selector(WZToolViewCell.shareButtonClick))
        addSubview(shareButton)
        
        commentButton = addSubButton(title: "90", tag: #selector(WZToolViewCell.commentButtonClick))
        addSubview(commentButton)
        
        commendButton = addSubButton(title: "111", tag: #selector(WZToolViewCell.commendButtonClick))
        addSubview(commendButton)
        
    }
    
    private func addSubViewLayout() {
        shareButton.snp.makeConstraints { (make) in
            make.left.top.bottom.equalTo(self)
            make.size.equalTo(CGSize(width: SCREEN_WIDTH / 3, height: 40 * SCREEN_HEIGHT))
        }
        commentButton.snp.makeConstraints { (make) in
            make.left.equalTo(shareButton.snp.right)
            make.top.bottom.equalTo(self)
            make.size.equalTo(CGSize(width: SCREEN_WIDTH / 3, height: 40 * SCREEN_HEIGHT))
        }
        commendButton.snp.makeConstraints { (make) in
            make.top.bottom.right.equalTo(self)
            make.size.equalTo(CGSize(width: SCREEN_WIDTH / 3, height: 40 * SCREEN_HEIGHT))
        }
    }
    
    @objc func shareButtonClick() {
        
    }
    
    @objc func commentButtonClick() {
        
    }
    
    @objc func commendButtonClick() {
        
    }
    
    func addSubButton(title number: String, tag funcation:Selector) -> UIButton {
        let currentButton = UIButton()
        currentButton.setTitle(number, for: .normal)
        currentButton.setTitleColor(UIColor.black, for: .normal)
        currentButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        currentButton.addTarget(self, action: funcation, for: .touchUpInside)
        return currentButton
    }

}
