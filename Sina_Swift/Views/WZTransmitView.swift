//
//  WZTransmitView.swift
//  Sina_Swift
//
//  Created by 王壮 on 2017/6/13.
//  Copyright © 2017年 Arther. All rights reserved.
//

import UIKit

class WZTransmitView: UIView {
    
    private var transmitText: UILabel?
    private var picView : WZPicCollectionView?
    private var flowLayout : UICollectionViewFlowLayout?
    private var tempHeight : CGFloat?
    private let tempWidth = SCREEN_WIDTH - 30 * WIDTH_RATIO
    private let margin = 5 * WIDTH_RATIO
    
    public var model : WZHomeModel? {
        didSet {
            transmitText?.text = model?.transmitText
            
            picView?.snp.updateConstraints({ (make) in
                if ((model?.pic?.count) != nil) {
                    switch model?.pic?.count {
                    case 1?:
                        make.height.equalTo(400 * HEIGHT_RATIO)
                    case 2?:
                        make.height.equalTo(400 * HEIGHT_RATIO)
                    default:
                        let count = (model?.pic?.count)! % 3
                        let temp = count == 0 ? 0 : 1
                        make.height.equalTo((tempWidth / 3) * CGFloat((model?.pic?.count)! / 3 + temp))
                    }
                }
            })
            self.layoutIfNeeded()
            picView?.picArray = model?.pic
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.colorWithHexString(hex: "e0e0e0")
        addChildViews()
        addChildLayouts()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addChildViews() {
        transmitText = UILabel()
        transmitText?.font = UIFont.systemFont(ofSize: 14)
        transmitText?.numberOfLines = 0
        addSubview(transmitText!)
        
        flowLayout = UICollectionViewFlowLayout()
        flowLayout?.minimumLineSpacing = margin
        flowLayout?.minimumInteritemSpacing = margin
        picView = WZPicCollectionView(frame: .zero, collectionViewLayout: flowLayout!)
        picView?.backgroundColor = UIColor.green
        addSubview(picView!)
    }
    
    private func addChildLayouts() {
        
        transmitText?.snp.makeConstraints({ (make) in
            make.top.equalTo(self).offset(10 * HEIGHT_RATIO)
            make.left.equalTo(self).offset(15 * WIDTH_RATIO)
            make.right.equalTo(self).offset(-15 * WIDTH_RATIO)
        })
        
        picView?.snp.makeConstraints({ (make) in
            make.top.equalTo((transmitText?.snp.bottom)!).offset(5 * HEIGHT_RATIO)
            make.left.right.equalTo(transmitText!)
            make.height.equalTo(100)
        })
        
    }

}
