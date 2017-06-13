//
//  WZPicCell.swift
//  Sina_Swift
//
//  Created by 王壮 on 2017/6/13.
//  Copyright © 2017年 Arther. All rights reserved.
//

import UIKit
import Kingfisher

class WZPicCell: UICollectionViewCell {
    
    private var image : UIImageView?
    public var url : String? {
        didSet {
            image?.kf.setImage(with: URL(string: (url)!))
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
        image = UIImageView()
        image?.contentMode = .redraw
        self.contentView.addSubview(image!)
    }
    
    private func addChildLayouts() {
        image?.snp.makeConstraints({ (make) in
            make.edges.equalTo(self)
        })
    }
}
