//
//  WZTestCell.swift
//  Sina_Swift
//
//  Created by neoby on 2018/5/9.
//  Copyright © 2018年 Arther. All rights reserved.
//

import UIKit

class WZTestCell: UITableViewCell {
    
    private var button: UIButton!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        button = UIButton(frame: CGRect(x: 100, y: 0, width: 40, height: 40))
        button.setTitle("0", for: .normal)
        button.backgroundColor = UIColor.red
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(WZTestCell.buttonClick), for: .touchUpInside)
        self.contentView.addSubview(button)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @objc func buttonClick() {
        if button.currentTitle == "1" {
            button.setTitle("0", for: .normal)
        } else {
            button.setTitle("1", for: .normal)
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
